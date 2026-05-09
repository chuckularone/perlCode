#!/usr/bin/perl
use strict;
use warnings;
use File::Find;
use File::stat;
use Time::Local;

# Check arguments
if (@ARGV != 2) {
    die "Usage: $0 <days> <fileMask>\nExample: $0 30 '*.log'\n";
}

my ($days, $mask) = @ARGV;
my $now = time;
my $age_seconds = $days * 24 * 60 * 60;

# Main routine to be used with File::Find
sub wanted {
    return unless -f $_;                         # Only files
    return unless $_ =~ glob_to_regex($mask);   # Match the file mask

    my $mtime = (stat($_))->mtime;
    if (($now - $mtime) > $age_seconds) {
        print "Deleting: $File::Find::name\n";
        unlink $File::Find::name or warn "Could not delete $_: $!";
    }
}

# Converts simple glob pattern (e.g. *.log) to regex
sub glob_to_regex {
    my ($glob) = @_;
    $glob =~ s/\./\\./g;
    $glob =~ s/\*/.*/g;
    $glob =~ s/\?././g;
    return qr/^$glob$/;
}

# Start searching and deleting
find(\&wanted, '.');

