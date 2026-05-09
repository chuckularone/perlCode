#!/usr/bin/perl
use warnings;
use strict;                          # Always use strict (It enforces scope)
use File::Copy;                      # Standard mod perl File operations
use lib "/home/chuck/Code/perllib";  # Path to custom perllib
use BIF::bifFile;                    # file read and write functions

if ($#ARGV < 1){
        print "\nUSAGE: getXmlVal.pl FILENAME TagToScanFor\n\n";
} else {
    my $inputfile = shift;
    my $lookfor   = shift;
    my $data = bifFile::slurpUndef($inputfile);

    my $foundVal = findXMLvalue($data, $lookfor) or die "Invalid value name";
    print "$foundVal";
}

sub findXMLvalue {
    my $inData = shift;
    my $value  = shift;
    $inData =~ m/\<\Q$value\E\>(.*)\<\/\Q$value\E\>/;
    my $retval=$1;
    return $retval;
}

# <h1 class="CurrentConditions--location--1YWj_">Village Green-Green Ridge, PA</h1>
# <span data-testid="TemperatureValue" class="CurrentConditions--tempValue--MHmYY">29°</span>
