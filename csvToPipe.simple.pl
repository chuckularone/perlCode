#!/usr/bin/perl

use strict;
use warnings;

my $csv_file = shift @ARGV;

open(my $csv_fh, '<', $csv_file) or die "Can't open $csv_file: $!\n";
my $pipe_file = $csv_file;
$pipe_file =~ s/\.csv$/\.txt/;

open(my $pipe_fh, '>', $pipe_file) or die "Can't create $pipe_file: $!\n";

while (my $line = <$csv_fh>) {
  chomp $line;
  my @fields = split /,/, $line;
  print $pipe_fh join('|', @fields) . "\n";
}

close($csv_fh);
close($pipe_fh);

print "Conversion complete: $csv_file => $pipe_file\n";

