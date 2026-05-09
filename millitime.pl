#!/usr/bin/perl -w
#
# This is a new time function that uses Time::HiRes to supply 
#    The time in milliseconds
#
# 20100908 - Chuck McKenna 
#
use Time::HiRes qw(time);
#print time;
$num = time;
printf ("%011.5f", $num);

# the following line is just for demo purposes, it needs to be removed
print "\n";
