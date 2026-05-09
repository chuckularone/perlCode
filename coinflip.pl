#!/usr/bin/perl

use strict;
use warnings;
use Time::HiRes qw(gettimeofday tv_interval);

# Read number of flips from command line
my $num_flips = shift;

# Initialize counters for heads and tails
my $num_heads = 0;
my $num_tails = 0;

# Initialize counters for streaks of heads and tails
my $max_heads_streak = 0;
my $max_tails_streak = 0;
my $current_heads_streak = 0;
my $current_tails_streak = 0;

# Record start time
my $start_time = [gettimeofday];

# Simulate coin flips
for (my $i = 0; $i < $num_flips; $i++) {
    my $coin = int(rand(2));  # 0 = heads, 1 = tails
    if ($coin == 0) {
        $num_heads++;
        $current_heads_streak++;
        $current_tails_streak = 0;
        if ($current_heads_streak > $max_heads_streak) {
            $max_heads_streak = $current_heads_streak;
        }
    } else {
        $num_tails++;
        $current_tails_streak++;
        $current_heads_streak = 0;
        if ($current_tails_streak > $max_tails_streak) {
            $max_tails_streak = $current_tails_streak;
        }
    }
}

# Record end time and calculate elapsed time
my $end_time = [gettimeofday];
my $elapsed_time = tv_interval($start_time, $end_time) * 1000;

# Calculate percentage of heads and tails
my $percent_heads = sprintf("%.8f", $num_heads / $num_flips * 100);
my $percent_tails = sprintf("%.8f", $num_tails / $num_flips * 100);

# Output results
print "Total flips: $num_flips\n";
print "Heads: $num_heads - $percent_heads%\n";
print "Tails: $num_tails - $percent_tails%\n";
print "Longest heads streak: $max_heads_streak\n";
print "Longest tails streak: $max_tails_streak\n";
print "Elapsed time: $elapsed_time ms\n";

