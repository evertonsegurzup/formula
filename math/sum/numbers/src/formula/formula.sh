#!/bin/sh
runFormula() {

re='^[0-9]+$'

if ! [[ $NUMBER_ONE =~ $re ]] ; then
        echo "First input is not a number. Please try again";
	exit 1;
fi;


if ! [[ $NUMBER_TWO =~ $re ]] ; then
        echo "Second input is not a number. Please try again";
	exit 1;
fi;

echo "The sum of numbers is: $(($NUMBER_ONE + $NUMBER_TWO ))"  

}
