#!/bin/bash

# Function to perform calculations
calculate() {
    echo "Enter first number: "
    read a
    echo "Enter operator (+, -, *, /): "
    read op
    echo "Enter second number: "
    read b
    clear
    result=$(echo "$a $op $b" | bc -l)
    echo "Result: $result"
}

stop() {
    clear
    exit 0
}

# Calculator loop
while true; do
    echo "Calculator"
    echo "1. Perform Calculation"
    echo "2. Exit to Main Menu"
    read -p "Choose an option: " choice
    case $choice in
        1) calculate ;;
        2) stop ;;
        *) echo "Invalid option" ;;
    esac
done