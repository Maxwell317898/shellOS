#!/bin/bash

clear

# Function to display the main menu
display_menu() {
    echo "Welcome to the Terminal OS"
    echo "1. Calculator"
    echo "2. Tic-Tac-Toe"
    echo "3. Exit"
}

# Function to run the calculator
run_calculator() {
    clear
    "$HOME/shellos/calculator.sh"
}

# Function to run Tic-Tac-Toe
run_tictactoe() {
    "$HOME/shellos/tictactoe.sh"
}

# Main loop
while true; do
    display_menu
    read -p "Choose an option: " choice
    case $choice in
        1) run_calculator ;;
        2) run_tictactoe ;;
        3) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option" ;;
    esac
done
