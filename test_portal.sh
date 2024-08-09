#!/bin/bash

<<doc
Name: User Signup and Test Script
Date: Current Date
Description: This script allows users to sign up, set a password, and take a test. It checks for existing usernames and provides results after the test.
Usage: ./signup_test.sh
doc

# Display menu options
echo "1. Signup"
echo "2. Signin"
echo "3. Exit"

# Function to handle password input
handle_password() {
    while true; do
        echo "$user" >> User.csv

        echo "Enter password:"
        read -s passwd
        echo "Confirm password:"
        read -s confirm

        if [ "$passwd" = "$confirm" ]; then
            echo "$passwd" >> Password.csv
            echo "User added successfully."
            break
        else
            echo "Passwords do not match, please enter them again."
        fi
    done
}

# User choices
read -p "Enter choice: " choice
case $choice in
    1)
        userlist=($(cat User.csv))

        read -p "User name: " user

        # Check if User.csv is empty
        if [ "${#userlist[@]}" -eq 0 ]; then
            handle_password
        fi

        # Check for existing usernames
        for user_name in "${userlist[@]}"; do
            if [ "$user" != "$user_name" ]; then
                handle_password
            else
                echo "User name already exists"
            fi
        done
        ;;
    2)
        userlist=($(cat User.csv))
        passwordlist=($(cat Password.csv))
        read -p "User name: " user
        read -s -p "Enter password: " passwd
        length=${#userlist[@]}
        for i in $(seq 0 $((length - 1))); do
            if [ "$user" = "${userlist[i]}" ]; then
                echo "User found at index $i: ${userlist[i]}"
                index=$i
            fi
        done
        if [ "$passwd" = "${passwordlist[index]}" ]; then
            echo "passwd found at index $i: ${passwordlist[i]}"
            echo "Login successfully"
            echo "1. Take Test"
            echo "2. Exit"        
            read -p "Enter a choice: " choice
            length=(`wc -l questionbank.txt`)

           if [ "$choice" -eq 1 ]; then
                for i in $(seq 5 5 "$length"); do
                head -$i questionbank.txt | tail -5

                for t in $(seq 10 -1 1); do
                  echo -ne "\r Enter Option: ($t)"
                  read -t 2 option

                  if [ -n "$option" ]; then
                    echo "$option" >> Userans.csv
                    break
                  else
                   echo "e" >> Userans.csv
                   break
                 fi
                 done
            echo ""
            result=1  # Set the flag indicating the test is completed

           if [ "$choice" -eq 2 ]; then
            exit_flag=1  # Set the exit flag to exit the outer loop
            break  # Exit the main loop when the user chooses to exit
           fi
       done
 # Display results if the test is completed
if [ "$result" -eq 1 ]; then
    echo " <<-------------------------------Result------------------------------>> "
    correctans=($(cat Correctans.csv))
    userans=($(cat Userans.csv))
    total=0

    # Assuming each question has 5 lines
    for ((i = 0; i < ${#correctans[@]}; i++)); do
        echo "Question $((i + 1)):"
        head -$((i * 5 + 5)) questionbank.txt | tail -5

        # Compare the correct answer with the user's answer
        if [ "${correctans[i]}" = "${userans[i]}" ]; then
            echo "Correct Answer is ${correctans[i]} "
            ((total++))
        elif [ "${userans[i]}" = "e" ]; then
            echo "Timeout"
        else
            echo "Correct Answer is ${correctans[i]} "
            echo -e "${userans[i]} is \033[0;31mWrong answer\033[0m"
        fi

        echo ""
    done

    echo "Total Correct Answers: $total/${#correctans[@]}"
fi
elif [ "$choice" -eq 2 ]; then
    echo "Exiting..............."
    exit_flag=1  # Set the exit flag to exit the outer loop
fi

else
            echo ""
            echo "Wrong username or password."
        fi
        ;;
    3)
        echo "Exiting .........! "
        ;;
    *)
        echo "Invalid choice. Exiting."
        ;;
esac


