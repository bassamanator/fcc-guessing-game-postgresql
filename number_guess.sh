#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET=$((1 + RANDOM % 1000))

COUNT=0
VAR=$($PSQL "")

MAIN_MENU() {
	if [[ $1 ]]; then
		echo -e "\n$1"
	fi

	echo -e "\nEnter your username: $SECRET"

	read USER
	GET_USER=$($PSQL "select * from users where username='$USER'")
	if [[ -z $GET_USER ]]; then
		GET_USER=$($PSQL "insert into users (username) values('$USER') returning user_id")
		USER_ID=$(echo "$GET_USER" | awk 'NR==1 {print $1}')
		echo $USER_ID
		echo -e "\nWelcome, $USER! It looks like this is your first time here."
	else
		echo -e "Welcome back, $USER! You have played <games_played> games, and your best game took <best_game> guesses."
	fi

	echo -e "\nGuess the secret number between 1 and 1000:"
	GAME_ID=$($PSQL "insert into games (user_id) values($USER_ID) returning game_id")
	GAME_ID=$(echo "$GAME_ID" | awk 'NR==1 {print $1}')

	SOLVED=false
	while true; do
		((COUNT++))

		read GUESS
		if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
			echo "That is not an integer, guess again:"
		elif [ $GUESS -eq $SECRET ]; then
			echo -e "\nYou guessed it in $COUNT tries. The secret number was $SECRET. Nice job!"
			SOLVED=true
		elif [ $GUESS -gt $SECRET ]; then
			echo -e "\nIt's lower than that, guess again:"
		else
			echo -e "\nIt's higher than that, guess again:"
		fi

		if [[ "$SOLVED" == true ]]; then
			UPDATE=$($PSQL "update games set num_guesses=$COUNT, solved=true where game_id=$GAME_ID")
			exit 0
		else
			UPDATE=$($PSQL "update games set num_guesses=$COUNT, solved=false where game_id=$GAME_ID")
		fi

	done

}

MAIN_MENU
