#!/usr/bin/perl
use strict;
use warnings;

# Define the alphabet
my @alphabet = 'A'..'Z';

# Shuffle the alphabet randomly
my @shuffled_alphabet = shuffle(@alphabet);

# Print the alphabet
print "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z\n";

# Print the shuffled alphabet
print join(' ', @shuffled_alphabet), "\n";

# Shuffle an array randomly
sub shuffle {
    my @array = @_;
    my $i = scalar(@array);
    while ($i--) {
        my $j = int(rand($i+1));
        @array[$i, $j] = @array[$j, $i];
    }
    return @array;
}
