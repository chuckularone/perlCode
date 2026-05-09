#!/usr/bin/perl
use warnings;
use strict;                          # Always use strict (It enforces scope)
use File::Copy;                      # Standard mod perl File operations
use lib "/home/chuck/Code/perllib";  # Path to custom perllib
use BIF::bifFile;                    # file read and write functions

my $inputfile = shift;
my $data = bifFile::slurpUndef($inputfile);
$data =~ m/Last WX report\>(.*)\<\/tr\>/;
#my $retval=$1;
print $1;

