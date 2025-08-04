#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
GP=""
BP=""
RANDOM_NUMBER=$((1 + $RANDOM % 1000))
echo "Enter your username:"
read USER_NAME
USER_NAME_QUERY=$($PSQL "SELECT games_played, best_game FROM users WHERE name='$USER_NAME'")
if [[ -z $USER_NAME_QUERY ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  INSERTION=$($PSQL "INSERT INTO users(name, games_played) VALUES('$USER_NAME', 0)")
  GP=0
else
  while read GAMES_PLAYED BAR BEST_GAME 
  do
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    BP=$BEST_GAME
    GP=$GAMES_PLAYED
  done <<< "$USER_NAME_QUERY"
fi

echo -e "\nGuess the secret number between 1 and 1000:"
INPUT=""
GUESS=0
while [[ $INPUT -ne $RANDOM_NUMBER ]]
do
  read INPUT
  GUESS=$((GUESS+1))
  if [[ "$INPUT" =~ ^[0-9]+$ ]];
  then
    if [[ $INPUT -eq $RANDOM_NUMBER ]]
    then
      echo -e "\nYou guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      GP=$((GP+1))
      UPDATE_GP=$($PSQL "UPDATE users SET games_played=$GP WHERE name='$USER_NAME'")
      if [[ -z $BP || $BP -gt $GUESS ]]
      then
        UPDATE_BP=$($PSQL "UPDATE users SET best_game=$GUESS WHERE name='$USER_NAME'")
      fi
    else
      if [[ $INPUT -lt $RANDOM_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      else
        echo -e "\nIt's lower than that, guess again:"
      fi
    fi
  else
    echo -e "\nThat is not an integer, guess again:"
    read NEWINPUT
    GUESS=$((GUESS+1))
    while [[ ! "$NEWINPUT" =~ ^[0-9]+$ ]]
    do 
      echo -e "\nThat is not an integer, guess again:"
      read NEWINPUT
      GUESS=$(($GUESS+1))
    done
    INPUT=$NEWINPUT
    if [[ $INPUT -eq $RANDOM_NUMBER ]]
    then
      echo -e "\nYou guessed it in $GUESS tries. The secret number was $RANDOM_NUMBER. Nice job!"
      GP=$((GP+1))
      UPDATE_GP=$($PSQL "UPDATE users SET games_played=$GP WHERE name='$USER_NAME'")
      if [[ -z $BP || $BP -gt $GUESS ]]
      then
        UPDATE_BP=$($PSQL "UPDATE users SET best_game=$GUESS WHERE name='$USER_NAME'")
      fi
    else
      if [[ $INPUT -lt $RANDOM_NUMBER ]]
      then
        echo -e "\nIt's higher than that, guess again:"
      else
        echo -e "\nIt's lower than that, guess again:"
      fi
    fi
  fi
done

