#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET=$((1 + RANDOM % 1000))

COUNT=0

echo -e "\nEnter your username:"

read USER
GET_USER=$($PSQL "select count(game_id),
	user_id,
	username
from users
	left join games using (user_id)
where username = '$USER'
group by user_id,
	username;")

if [[ -z $GET_USER ]]; then
	GET_USER=$($PSQL "insert into users (username) values('$USER') returning user_id")
	USER_ID=$(echo "$GET_USER" | awk 'NR==1 {print $1}')
	echo -e "\nWelcome, $USER! It looks like this is your first time here."
else
	IFS='|' read -r GAMES_PLAYED USER_ID USER <<<"$GET_USER"
	BEST_GAME=$($PSQL "select num_guesses from users left join games using (user_id) where username='$USER' order by num_guesses limit 1")
	if [[ -z "$BEST_GAME" ]]; then
		BEST_GAME=0
	fi
	echo -e "Welcome back, $USER! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"
# GAME_ID=$($PSQL "insert into games (user_id) values($USER_ID) returning game_id")
# GAME_ID=$(echo "$GAME_ID" | awk 'NR==1 {print $1}')

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
		UPDATE=$($PSQL "insert into games(num_guesses,user_id) values($COUNT,$USER_ID)")
		break
	fi
done
