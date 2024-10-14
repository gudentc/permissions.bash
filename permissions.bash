#!/bin/bash

display_help() {
        #short help text to explain permision codes
        echo "Numeric Permissions Code Method"
        echo ""
        echo "     user|group|other"
        echo "     -rwx| rwx | rwx"
        echo ""
        echo " 4=read  2=write  1=execute"
        echo ""
        echo "        examples"
        echo "     -rwxrwxrwx = 777"
        echo "     -rwxr--r-- = 744"
        echo ""
        return
}

echo ""
echo "*** File Permissions Manager ***"
echo ""

while : #outer while loop to repeat script if another permission need to be changed
do
        while :  #file selection loop in case incorrect file is entered
        do
                # get file or path to file
                echo -n "Enter file name or directory : "
                read file
                echo ""

                #determine if selected file is a file and display its current permissions
                if test -f $file
                        then
                                echo "This is a file: "
                                ls -la "${file}"
                                #break permission code up into three seperate number to read and output permission
                                user=$(stat -c '%a' "$file" | cut -b 1)
                                group=$(stat -c '%a' "$file" | cut -b 2)
                                other=$(stat -c '%a' "$file" | cut -b 3)
                                echo "" 

                                case $user in
                                        "4" | "5" | "6" | "7")
                                                echo "Read permission(user) "
                                                ;;
                                        *)
                                esac
                                case $user in
                                        "2" | "3" | "6" | "7")
                                                echo "Write permission(user) "
                                                ;;
                                        *)
                                esac
                                case $user in
                                        "1" | "3" | "5" | "7")
                                                echo "Execute permission(user) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "4" | "5" | "6" | "7")
                                                echo "Read permission(group) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "2" | "3" | "6" | "7")
                                                echo "Write permission(group) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "1" | "3" | "5" | "7")
                                                echo "Execute permission(group) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "4" | "5" | "6" | "7")
                                                echo "Read permission(other) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "2" | "3" | "6" | "7")
                                                echo "Write permission(other) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "1" | "3" | "5" | "7")
                                                echo "Execute permission(other) "
                                                ;;
                                        *)
                                esac
                                break  #exit loop

                #determine if selected file is a directory and display its current permissions
                elif test -d $file
                        then
                                echo "This is a directory: "
                                ls -ld "${file}"
                                #break permission code up into three seperate number to read and output permission
                                user=$(stat -c '%a' "$file" | cut -b 1)
                                group=$(stat -c '%a' "$file" | cut -b 2)
                                other=$(stat -c '%a' "$file" | cut -b 3)
                                echo ""

                                case $user in
                                        "4" | "5" | "6" | "7")
                                                echo "Read permission(user) "
                                                ;;
                                        *)
                                esac
                                case $user in
                                        "2" | "3" | "6" | "7")
                                                echo "Write permission(user) "
                                                ;;
                                        *)
                                esac
                                case $user in
                                        "1" | "3" | "5" | "7")
                                                echo "Execute permission(user) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "4" | "5" | "6" | "7")
                                                echo "Read permission(group) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "2" | "3" | "6" | "7")
                                                echo "Write permission(group) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "1" | "3" | "5" | "7")
                                                echo "Execute permission(group) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "4" | "5" | "6" | "7")
                                                echo "Read permission(other) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "2" | "3" | "6" | "7")
                                                echo "Write permission(other) "
                                                ;;
                                        *)
                                esac
                                case $group in
                                        "1" | "3" | "5" | "7")
                                                echo "Execute permission(other) "
                                                ;;
                                        *)
                                esac
                                break  #exit loop

                else
                        #bad file selection - repeat loop
                        echo "Did not find any file or directory with name $file"
                        echo ""
                fi
        done

        echo ""
        echo "Enter 3 digit permissions code for file selected."
        echo "****  enter -h for help or -q to exit  ****"
        echo "** you may be prompted for your password **"

        while :
        do
                echo -n "Code : "
                read choice
                echo ""

                case $choice in
                        -h | h)
                                display_help  # Call help function
                                ;;
                        -q | q)
                                echo "Good Bye"
                                exit 1
                                ;;
                        *)
                esac
                #validate code is a 3-digit numeric
                if [[ $choice =~ ^[0-9]{3}$ ]]; then
                        #validate code is legitamate permissions code, error msq suppressed, repeat loop if invalid
                        sudo chmod "$choice" "$file" 2> /dev/null  &&
                                echo "Valid code: $choice, permissions changed." ||
                                echo "Invalid code! $choice, try again."
                        #if valide code entered, permissions will change - exit loop
                        if [ $(stat -c '%a' "$file") -eq $choice ]; then
                                break
                        fi
                else
                        echo "Invalid input. Try again."  #repeat loop if other than 3-digit numeric entered
                fi
        done

        #prompt user if they want to change another file
        read -n 1 -p "Another [y/n] : " another
                if [[ $another =~ [yY] ]]; then
                        echo ""
                else
                        echo ""
                        echo "Good Bye"
                        exit 1
                fi

done

