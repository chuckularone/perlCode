#!/usr/bin/perl
use strict;
use warnings;

# Read input text from command line
my $text = join("", <>);

# Extract data fields using regular expressions
my ($csid) = $text =~ /Csid:\s+(\S+)/;
my ($lab_id) = $text =~ /Lab ID:\s+(\S+)/;
my ($transmit_route_code) = $text =~ /Transmit\/Route Code:\s+(\S+)/;
my ($vendor_mnemonic) = $text =~ /Vendor Mnemonic:\s+(\S+)/;

# Extract account numbers
my @account_numbers = $text =~ /\b(\d{8})\b/g;

# Concatenate account numbers with a space between them
my $account_numbers_concatenated = join(" ", @account_numbers);


# Print the extracted data fields with "Test DB:" at the beginning

# Print the extracted data fields
print "MSH-3 Sending Application: $vendor_mnemonic\n" if $vendor_mnemonic;
print "MSH-4 Sending Facility: $csid\n" if $csid;
print "MSH-5 Receiving Application: 1100\n";
print "MSH-6 Receiving Facility: $lab_id\n" if $lab_id;
print "PID-18.1 LabCorp Client ID # / Account #: $account_numbers_concatenated\n\n" if @account_numbers;

print "\nTest DB:\n\n";
# Print the input data
print $text;

