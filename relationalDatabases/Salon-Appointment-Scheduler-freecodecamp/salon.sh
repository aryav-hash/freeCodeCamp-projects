#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~Welcome To Cosmos Salon~~~~"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nHere are our services:- \n"
  fi

  echo -e "1) Haircut \n2) Color \n3) Trim"
  
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) USER_MENU "$SERVICE_ID_SELECTED" ;;
    2) USER_MENU "$SERVICE_ID_SELECTED" ;;
    3) USER_MENU "$SERVICE_ID_SELECTED" ;;
    *) MAIN_MENU "Service not found. Please pick one of these:- ";;
  esac
}

USER_MENU() {
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $1;")
  echo -e "\nPlease provide your phone number: "
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nMay I get to know your name please:- "
    read CUSTOMER_NAME
    INSERT_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
  fi
  echo -e "\nAt what time would you like to schedule your appointment?"
  read SERVICE_TIME
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, time, customer_id) VALUES($SERVICE_ID_SELECTED, '$SERVICE_TIME', $CUSTOMER_ID)")
  echo -e "\nI have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

MAIN_MENU
