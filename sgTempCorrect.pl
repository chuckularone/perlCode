#!/usr/bin/perl
use warnings;
use strict;
my $sg = shift;
my $temp = shift;
my $tempNum = substr($temp, 0, -1);
my $CF = substr($temp, -1, 1, '');

if ($CF eq "F" || $CF eq "f") {
    my $outTemp = $temp;
    my $correction = 1.313454 - 0.132674*$outTemp + 0.002057793*$outTemp*$outTemp - 0.000002627634*$outTemp*$outTemp*$outTemp;
    my $outgrav = $sg + ($correction * 0.001);
    print "Correction = $correction\n";
    printf "Corrected SG: %1.3f\n", $outgrav;
}
elsif ($CF eq "C" || $CF eq "c") {
    my $outTemp = $tempNum * 9/5 +32;
    my $correction = 1.313454 - 0.132674*$outTemp + 0.002057793*$outTemp*$outTemp - 0.000002627634*$outTemp*$outTemp*$outTemp;
    my $outgrav = $sg + ($correction * 0.001);
    print "Correction = $correction\n";
    printf "Corrected SG: %1.3f\n", $outgrav;
}
else {
    print "Values not recognized\n\nUSAGE: \nsgCorrectCF.pl <SG in the format 1.nnn> <Temp in the format nnC or (n)nnF>\n";
}

