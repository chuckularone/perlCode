#!/usr/bin/perl

use strict;
use warnings;

my $domain = shift @ARGV;

# Validate domain name format
if ($domain !~ /^[a-zA-Z0-9\-\.]+\.[a-zA-Z]{2,}$/) {
  print "Invalid domain name format.\n";
  exit;
}

# Connect to WHOIS server
use Net::Whois::Raw;
my $whois_server = whois_server($domain);
if (!defined $whois_server) {
  print "Could not determine WHOIS server for domain.\n";
  exit;
}

my $whois_result = whois($domain, $whois_server);
if ($whois_result =~ /No match for/) {
  print "Domain is available!\n";
} else {
  print "Domain is not available.\n";
}

# Determine the appropriate WHOIS server for the domain
sub whois_server {
  my $domain = shift;
  my $whois_server;
  my $tld = lc((split /\./, $domain)[-1]);

  # Some TLDs have specific WHOIS servers
  if ($tld eq 'com' || $tld eq 'net') {
    $whois_server = 'whois.verisign-grs.com';
  } elsif ($tld eq 'org') {
    $whois_server = 'whois.pir.org';
  } elsif ($tld eq 'biz') {
    $whois_server = 'whois.biz';
  } elsif ($tld eq 'info') {
    $whois_server = 'whois.afilias.net';
  } elsif ($tld eq 'us') {
    $whois_server = 'whois.nic.us';
  } else {
    # For all other TLDs, use the IANA WHOIS server
    $whois_server = 'whois.iana.org';
  }

  # Query the IANA WHOIS server if necessary to get the appropriate WHOIS server
  my $iana_result = whois($tld, 'whois.iana.org');
  if ($iana_result =~ /whois:\s+(.*)/i) {
    $whois_server = $1;
  }

  return $whois_server;
}

