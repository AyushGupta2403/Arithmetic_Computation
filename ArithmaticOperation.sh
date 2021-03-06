#!/bin/bash -x
#Accepting three inputs for performing operation
read -p "Enter the first input" a
read -p "Enter the second input" b
read -p "Enter the third input" c

#Performing operations
operation1=$(($a+$b*$c))
#Performing operation number 2
operation2=$(($a*$b+$c))
#Performing operation number 3
operation3=`echo "scale=2; $c+$a/$b" | bc`
#Performing operation number 4
operation4=`echo "scale=2; $a%$b+$c" | bc`

echo $operation1
echo $operation2
echo $operation3
echo $operation4

#Storing operation in a dictionary

declare -A allOperation
allOperation[operation1]=$operation1
allOperation[operation2]=$operation2
allOperation[operation3]=$operation3
allOperation[operation4]=$operation4

#Storing value of dictionary to array
for (( index=0; index<${#allOperation[@]}; index++ ))
do
   array[index]=${allOperation[operation$((index+1))]}
done
echo ${array[@]}

#Sorting in descending order 

for (( index=0;index<${#allOperation[@]};index++ ))
do
	for (( secondindex=0;secondindex<${#allOperation[@]}-1;secondindex++ ))
	do
		if (($(echo "${array[secondindex]} < ${array[secondindex+1]}" | bc -l) ))
			then
					temp=${array[secondindex]}
					array[secondindex]=${array[secondindex+1]}
					array[secondindex+1]=$temp
		fi
	done
done
echo "Operation Result In Descending Order :"
echo ${array[@]}

#Sorting in ascending order

for (( index=0;index<${#allOperation[@]};index++ ))
do
   for (( secondindex=0;secondindex<${#allOperation[@]}-1;secondindex++ ))
   do
      if (($(echo "${array[secondindex]} > ${array[secondindex+1]}" | bc -l) ))
         then
         temp=${array[secondindex]}
         array[secondindex]=${array[secondindex+1]}
         array[secondindex+1]=$temp
      fi
   done
done
echo "Operation Result In Ascending Order :"
echo ${array[@]}
