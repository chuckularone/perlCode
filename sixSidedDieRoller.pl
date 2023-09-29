#!/usr/bin/perl

use strict;
use warnings;
use Time::HiRes qw(gettimeofday tv_interval);

# Read number of rolls from command line
my $num_rolls = shift;

# Initialize counters for each possible outcome
my %outcome_counts = (
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 0,
    6 => 0,
);

# Initialize counters for streaks of each possible outcome
my %max_streaks = (
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 0,
    6 => 0,
);
my %current_streaks = (
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 0,
    5 => 0,
    6 => 0,
);

# Record start time
my $start_time = [gettimeofday];

# Simulate dice rolls
for (my $i = 0; $i < $num_rolls; $i++) {
    my $outcome = int(rand(6)) + 1;  # random integer between 1 and 6
    $outcome_counts{$outcome}++;
    $current_streaks{$outcome}++;
    foreach my $key (keys %max_streaks) {
        if ($outcome == $key) {
            if ($current_streaks{$key} > $max_streaks{$key}) {
                $max_streaks{$key} = $current_streaks{$key};
            }
        } else {
            $current_streaks{$key} = 0;
        }
    }
}

# Record end time and calculate elapsed time
my $end_time = [gettimeofday];
my $elapsed_time = tv_interval($start_time, $end_time) * 1000;

# Calculate percentages of each possible outcome
my %outcome_percentages;
foreach my $key (keys %outcome_counts) {
    $outcome_percentages{$key} = sprintf("%.8f", $outcome_counts{$key} / $num_rolls * 100);
}

# Output results
print "Total rolls: $num_rolls\n";
foreach my $key (sort {$a <=> $b} keys %outcome_counts) {
    print "Outcome $key: $outcome_counts{$key} - $outcome_percentages{$key}%\n";
}
foreach my $key (sort {$a <=> $b} keys %max_streaks) {
    print "Longest streak of outcome $key: $max_streaks{$key}\n";
}
print "Elapsed time: $elapsed_time ms\n";

