#!/bin/bash

movies=("RRR" "eega" "djtillu" "bahubali")

# size of above value is 4
# index is 0.1.2,3

echo "first movie is: ${movies[0]}"
echo "first movie is:  ${movies[1]}"
echo "first movie is:  ${movies[@]}"
# here @ means all values 
