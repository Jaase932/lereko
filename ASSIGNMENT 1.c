/*
NAME:		LEREKO
SURNAME:	RAMATABOE
STUDENT NO: 202003168
DATE:		28/10/2022
*/
#include <stdio.h>
#include <math.h>


int isPrime(int num)          // Prime function
{
	if(num == 0 || num == 1){
		return 0;
	}
	int i;
	for(i = 2; i <= num/2; i++)   // declare fuction to iterate from 2 
	{
		if(num % i == 0)
		{
			return 0;
		}
	}
	return 1;
}


int reverse_num(int num){
	int rev = 0, rem;
	
	while(num != 0){     // reverse numbers
		rem = num%10;    
		rev = rev*10 + rem; 
		num/=10;
	}
	return rev;
}


int main(void) // declare to not return any value
{
	int count = 0;
	for(int x = 0;count < 10; x++)
	{
		if(isPrime(x))  						    // check if x is prime
		{
			int sqr, reversed_square;
			sqr = x * x;                      	   	 // declare square fuction
			reversed_square = (reverse_num(sqr));	 // reverse square fuction
			if(reversed_square != sqr)               // check palindrome
			   for(int i = 0; i <= reversed_square / 2; i++)  
			   {
			   	   if(reversed_square == i * i && isPrime(i))   //
					{
						printf("%d \n", sqr);           // print reversible prime square
						count++;
					}
			   	   
			   }
	    }
	}
}
