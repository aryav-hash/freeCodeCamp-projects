#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  INPUT=$1
  if [[ $INPUT =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$INPUT
    QUERY_OUTPUT=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
    if [[ -z $QUERY_OUTPUT ]]
      then
        echo "I could not find that element in the database."
      else
        echo "$QUERY_OUTPUT" | while read NAME BAR SYMBOL BAR TYPE BAR ATOMIC_MASS BAR MT_PT BAR BT_PT BAR TYPE_ID 
        do
        echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MT_PT celsius and a boiling point of $BT_PT celsius."
        done 
      fi
    else
    if [[ -n "$INPUT" ]]
      then
        SYMBOL=$INPUT
        QUERY_OUTPUT=$($PSQL "SELECT name, atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$SYMBOL'")
        if [[ -z $QUERY_OUTPUT ]]
          then
            NAME=$SYMBOL
            QUERY_OUTPUT=$($PSQL "SELECT symbol, atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$NAME'")
            if [[ -z $QUERY_OUTPUT ]]
              then
              echo "I could not find that element in the database."
            else
              echo "$QUERY_OUTPUT" | while read SYMBOL BAR ATOMIC_NUMBER BAR TYPE BAR ATOMIC_MASS BAR MT_PT BAR BT_PT BAR TYPE_ID
              do
              echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MT_PT celsius and a boiling point of $BT_PT celsius."
              done
            fi
        else    
            echo "$QUERY_OUTPUT" | while read NAME BAR ATOMIC_NUMBER BAR TYPE BAR ATOMIC_MASS BAR MT_PT BAR BT_PT BAR TYPE_ID
            do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MT_PT celsius and a boiling point of $BT_PT celsius."
            done
        fi
    else
      echo "I could not find that element in the database."
    fi
  fi
fi

