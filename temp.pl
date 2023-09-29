#!/usr/bin/perl
my $num_rolls = 50000; 

for (my $i = 0; $i < $num_rolls; $i++) {
    my $outcome = int(rand(10)); # Generate random number from 0 - 9  
    print $outcome;
}




