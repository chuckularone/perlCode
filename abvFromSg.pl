#!/usr/bin/perl
use warnings;
use strict;
my $og = shift;
my $sg = shift;
my $abvOut;

$abvOut = ((76.08 * ($og - $sg) / (1.775 - $og)) * ($sg / 0.794));

print "Original Gravity: $og\nCurrent Gravity: $sg\nABV: ";
printf("%.2f", $abvOut);
print "%\n\n";


