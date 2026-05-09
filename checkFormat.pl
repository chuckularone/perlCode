#!/usr/bin/perl
use strict;
use warnings;

my $file = $ARGV[0] || die "Usage: $0 <file>\n";

open my $fh, "<:raw", $file or die "Cannot open: $!";

# Read first line
my $line = <$fh>;
close $fh;

print "First line length: " . length($line) . " bytes\n";
print "First 500 characters:\n";
print substr($line, 0, 500) . "\n\n";

# Check for different separators
my $tabs = ($line =~ tr/\t//);
my $commas = ($line =~ tr/,//);
my $pipes = ($line =~ tr/|//);

print "Tab count: $tabs\n";
print "Comma count: $commas\n";
print "Pipe count: $pipes\n\n";

# Show hex dump of first 200 bytes
print "Hex dump of first 200 bytes:\n";
my $first_bytes = substr($line, 0, 200);
for my $i (0 .. length($first_bytes) - 1) {
    my $char = substr($first_bytes, $i, 1);
    printf "%02x ", ord($char);
    print "\n" if ($i + 1) % 16 == 0;
}
print "\n";
