#!/bin/bash

# Initialize the board
board=(1 2 3 4 5 6 7 8 9)

# Function to draw the board
draw_board() {
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "---|---|---"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "---|---|---"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

# Function to check for a win
check_win() {
    for i in 0 3 6; do
        if [ "${board[$i]}" == "${board[$(($i+1))]}" ] && [ "${board[$i]}" == "${board[$(($i+2))]}" ]; then
            echo "Player $1 wins!"
            exit 0
        fi
    done
    for i in 0 1 2; do
        if [ "${board[$i]}" == "${board[$(($i+3))]}" ] && [ "${board[$i]}" == "${board[$(($i+6))]}" ]; then
            echo "Player $1 wins!"
            exit 0
        fi
    done
    if [ "${board[0]}" == "${board[4]}" ] && [ "${board[0]}" == "${board[8]}" ]; then
        echo "Player $1 wins!"
        exit 0
    fi
    if [ "${board[2]}" == "${board[4]}" ] && [ "${board[2]}" == "${board[6]}" ]; then
        echo "Player $1 wins!"
        exit 0
    fi
}

# Function to play Tic-Tac-Toe
play_tictactoe() {
    player=1
    while true; do
        draw_board
        read -p "Player $player, choose a position: " pos
        if [ "${board[$(($pos-1))]}" == "$pos" ]; then
            if [ $player -eq 1 ]; then
                board[$(($pos-1))]="X"
                player=2
            else
                board[$(($pos-1))]="O"
                player=1
            fi
            check_win $player
        else
            echo "Invalid position"
        fi
    done
}

stop() {
    clear
    exit 0
}

# Tic-Tac-Toe loop
while true; do
    echo "Tic-Tac-Toe"
    echo "1. Play Game"
    echo "2. Exit to Main Menu"
    read -p "Choose an option: " choice
    case $choice in
        1) play_tictactoe ;;
        2) stop ;;
        *) echo "Invalid option" ;;
    esac
done
