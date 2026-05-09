#!/usr/bin/perl

use strict;
use warnings;

sub roll_dice {
    my $num_dice = shift;
    my @rolls;
    for (1..$num_dice) {
        push @rolls, int(rand(6)) + 1;
    }
    return @rolls;
}

sub total_of_three_highest {
    my @rolls = sort { $b <=> $a } @_;
    my $total = 0;
    for (0..2) {
        $total += $rolls[$_];
    }
    return $total;
}

for (my $i = 1; $i <= 7; $i++) {
    print "Roll $i:\n";
    my @dice_rolls = roll_dice(4);
    my $total = total_of_three_highest(@dice_rolls);
    print "  Rolls: @dice_rolls\n";
    print "  Total of three highest rolls: $total\n\n";
}

