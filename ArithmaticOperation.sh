#!/bin/bash -x
#Accepting three inputs for performing operation
read -p "Enter the first input" a
read -p "Enter the second input" b
read -p "Enter the third input" c

#Performing operations
echo $(($a+$b*$c))
#Performing operation number 2
echo $(($a*$b+$c))
#Performing operation number 3
echo $(($c+$a/$b))
