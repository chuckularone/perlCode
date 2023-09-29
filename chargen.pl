#!/usr/bin/perl

use strict;
use warnings;

# Define the number of dice rolls
my $rolls = 4;

# Define the number of sets of rolls
my $sets = 7;

print "Rolling for character traits:\n\n";

# Roll the die and calculate the total of the highest three rolls for each set
my @totals;
for (my $i = 0; $i < $sets; $i++) {
    my @results;
    for (my $j = 0; $j < $rolls; $j++) {
        push @results, int(rand(6)) + 1;
    }
    my @sorted_results = sort {$b <=> $a} @results;
    my $total = $sorted_results[0] + $sorted_results[1] + $sorted_results[2];
    push @totals, $total;
    print join(' ', @results) . " ($total)\n";
}

# Print the highest six totals for all sets of rolls

print "\n-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-\n\n";
my @sorted_totals = sort {$b <=> $a} @totals;
my @highest_six = splice(@sorted_totals, 0, 6);
print "Highest six rolls: " . join(' ', @highest_six) . "\n";

