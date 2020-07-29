import time
import euler

start_time = time.time()

# The prime 41, can be written as the sum of six consecutive primes:
#
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
#
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
#
# Which prime, below one-million, can be written as the sum of the most consecutive primes?

# create the prime list from the Sieve
primes = []
primes = euler.read_file(type='primes')

# Another list of all the sums
prime_sums = []




# Get the highest possible index of the primes
limit = 100

for i in range(limit):





print('Problem 50 =', prime_max, "and was", longest, "digits in length.")
print("Program took %s seconds to run." % (time.time() - start_time))


'''
//
//  main.cpp
//  ConsecutivePrimeSum
//
//  Created by Ben Cochran on 5/9/20.
//  Copyright © 2020 Ben Cochran. All rights reserved.
//
//  https://projecteuler.net/problem=50
​
#include <iostream>
#include "../primes.h"
​
using namespace std;
​
#define MILLION 1000000
//#define MILLION 1000
​
int main(int argc, const char * argv[]) {

    cout << "Consecutive prime sum - problem 50: https://projecteuler.net/problem=50\n";

    Primes p ("../1MPrimes");

    int answerPrime = 0;
    int answerPrimeSumTermCount = 0;

    for (int n=2; p.nthPrime (n) < MILLION; n++){
        int sum = 0;
        int termCount = 0;
        for ( int j=1; j < n; j++){
            sum += p.nthPrime (j);
            termCount++;
​
            // If the sum is to large, take awasy from the bottom side until corrected.
            for (int k=1; termCount > 0 && sum > p.nthPrime (n) && k < j; k++){
                sum -= p.nthPrime(k);
                termCount--;
            }

            if ( sum == p.nthPrime (n) )
                break;
        }

        if ( termCount >  answerPrimeSumTermCount){
            answerPrime = (int)p.nthPrime (n);
            answerPrimeSumTermCount = termCount;
        }
    }

    cout << "Prime, below one-million, can be written as the sum of the most consecutive primes is: "
         << answerPrime << "(" << answerPrimeSumTermCount << ")" << endl;

    return 0;
}
'''
