#!/usr/bin/perl

use strict;
#use warnings;

my $sides = shift;
my $times = shift;

if (length $sides == 0){
    $sides = 20;
}

if (length $times == 0){
    $times = 1;
}

sub roll_dice {
    my $num_dice = shift;
    my @rolls;
    for (1..$num_dice) {
        push @rolls, int(rand($sides)) + 1;
    }
    return @rolls;
}

for (my $i = 1; $i <= $times; $i++) {
    print "Roll $i:";
    my @dice_rolls = roll_dice(1);
    print "  @dice_rolls\n";
}

