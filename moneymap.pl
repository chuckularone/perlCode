#!/usr/bin/perl -w
#
# Chuck McKenna - 02/17/2009
# 
# This script is designed to take up to 11 digits 12345678901 and render
# them in the format $123,456,789.01.  
# This script disregards all whitespace in the input variable.
#

my $inNumber = $ARGV[0] || die "\nUSAGE: moneymap.pl <number or variable containing number>\n\n";

sub trim {
	my ( $input ) = @_;
	chomp $input;
	$input =~ s/[^0-9]+//g;
	return $input;	
}

sub splitnum {
	my ( $input ) = @_;
	$len = length $input;
	$pennies = substr $input, $len-2, 2;
    $dollars = substr $input, 0, $len-2;
	return ($dollars, $pennies);
}

sub commas {
	my ( $input ) = @_;
	$input = reverse;	
	$input =~ s/\d{3}(?=\d)(?!.*?\.)/$&,/g;
	$input = reverse;
    return $input;
}

my $cleanNum;
my $dollars;
my $outDollars;
my $pennies;

$cleanNum = trim $inNumber;
($dollars, $pennies) = splitnum $cleanNum;
$outDollars = commas $dollars;

print "\n$cleanNum\n$dollars\n$outDollars\n$pennies\n\n";

print "\$$dollars.$pennies\n";
#print "\$$outDollars.$pennies\n";

