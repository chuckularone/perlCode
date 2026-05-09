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
  my @fields = ();
  my $quoted = 0;
  my $field = '';

  for my $char (split //, $line) {
    if ($char eq ',' && !$quoted) {
      push @fields, $field;
      $field = '';
    } else {
      if ($char eq '"' && (!$quoted || substr($line, 0, 1) eq '"' && substr($line, -1) eq '"')) {
        $quoted = !$quoted;
      } else {
        $field .= $char;
      }
    }
  }

  push @fields, $field;
  for my $field (@fields) {
    $field =~ s/^\s*['"]+|\s*['"]+$//g;
  }
  print $pipe_fh join('|', @fields) . "\n";
}

close($csv_fh);
close($pipe_fh);

print "Conversion complete: $csv_file => $pipe_file\n";


# -=-=-=-=-=-=-=-=-=-=-=-

my $file = shift @ARGV;

open(my $fh, '<', $pipe_file) or die "Can't open $file: $!\n";
my $output_file = $pipe_file;
$output_file =~ s/\.txt$/_no_quotes.txt/;

open(my $out_fh, '>', $output_file) or die "Can't create $output_file: $!\n";

while (my $line = <$fh>) {
  $line =~ s/['"]//g;
  print $out_fh $line;
}

close($fh);
close($out_fh);

print "Quotes removed from $pipe_file and written to $output_file\n";

