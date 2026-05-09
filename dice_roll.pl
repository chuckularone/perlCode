#!/usr/bin/perl

use strict;
use warnings;

sub roll_dice {
    my ($num_sides, $num_rolls) = @_;
    $num_sides //= 20;
    $num_rolls //= 1;

    my @rolls;
    for (1..$num_rolls) {
        push @rolls, int(rand($num_sides)) + 1;
    }

    @rolls = sort { $a <=> $b } @rolls;

    return @rolls;
}

my ($sides, $rolls) = @ARGV;
my @sorted_rolls = roll_dice($sides, $rolls);

print "Rolling $rolls $sides-sided dice:\n";
for my $i (0..$#sorted_rolls) {
    print "Roll ", $i+1, ": ", $sorted_rolls[$i], "\n";
}

