#!/bin/bash

read -p "please enter the fruit name here::" fruits
case "$fruits" in 
     apple|Apple)
       echo "it's a apple" ;;
     banana)
       echo "it's a banana" ;;
    cherry|grape)
       echo "cherry or graph" ;;
    *)
       echo "unknown fruit";;
    esac

    