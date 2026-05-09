#!/usr/bin/perl

use strict;
use warnings;

# Read max number from command line
my $max = shift;

# Generate random number
my $random_number = int(rand($max)) + 1;

print "Random number between 1 and $max: $random_number\n";

