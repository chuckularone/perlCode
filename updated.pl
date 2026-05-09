#!/usr/bin/perl

use strict;
use warnings;

use Net::Whois::Raw;

# Read domain name from command line
my $domain = shift;
#my $domain = "rvinspectionpros.com";

if (!$domain) {
    print "Usage: \"updated.pl <domain name>\"\n";
    exit;
}


# Perform WHOIS lookup
my $whois = whois($domain);

# Extract relevant information
my ($updated_date, $creation_date);

if ($whois =~ /Updated Date:.*?(\d{4}-\d{2}-\d{2})/i) {
    $updated_date = $1;
}

if ($whois =~ /Creation Date:.*?(\d{4}-\d{2}-\d{2})/i) {
    $creation_date = $1;
}

# Pass information to existing script
if ($updated_date && $creation_date) {
    print "From: chuck\@mckenna.tv\n";
    print "Subject: $domain\n";
    print "Updated Date: $updated_date\nCreation Date: $creation_date\n";
} else {
    print "Could not find both 'Updated Date' and 'Creation Date' in the WHOIS record for $domain.\n";
}

#print "$whois\n";

