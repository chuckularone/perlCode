#!/usr/bin/perl

# Array of card ranks and suits
my @ranks = qw(2 3 4 5 6 7 8 9 10 J Q K A);
my @suits = qw(Spades Hearts Diamonds Clubs);

# Select a random rank and suit
my $rank = $ranks[int(rand(@ranks))];
my $suit = $suits[int(rand(@suits))];

# Print the selected card
print "Selected Card: $rank of $suit\n";

