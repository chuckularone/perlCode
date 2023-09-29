#!/usr/bin/perl
use strict;
#use warnings;

my $yearNo = shift;
my $moNo   = shift;
my $moPos  = 13;
my $wholeYearFlag = 0;
#
# Useage blurb: If year == "help" print useage
#
my $usage = "\nUSAGE: calendar.pl <YYYY> <(M)M>\n       Both Year and Month are optional\n       YYYY only: produces all 12 months\n       No vars: produces current year/month\n\n";
if ($yearNo eq "help") {
   print $usage;
   exit();
}
#
#Define calendar types
my @ytA = qw(calA calD calD calG calB calE calG calC calF calA calD calF);
my @ytB = qw(calA calD calE calA calC calF calA calD calG calB calE calG);
my @ytC = qw(calB calE calE calA calC calF calA calD calG calB calE calG);
my @ytD = qw(calB calE calF calB calD calG calB calE calA calC calF calA);
my @ytE = qw(calC calF calF calB calD calG calB calE calA calC calF calA);
my @ytF = qw(calC calF calG calC calE calA calC calF calB calD calG calB);
my @ytG = qw(calD calG calG calC calE calA calC calF calB calD calG calB);
my @ytH = qw(calD calG calA calD calF calB calD calG calC calE calA calC);
my @ytI = qw(calE calA calA calD calF calB calD calG calC calE calA calC);
my @ytJ = qw(calE calA calB calE calG calC calE calA calD calF calB calD);
my @ytK = qw(calF calB calB calE calG calC calE calA calD calF calB calD);
my @ytL = qw(calF calB calC calF calA calD calF calB calE calG calC calE);
my @ytM = qw(calG calC calC calF calA calD calF calB calE calG calC calE);
my @ytN = qw(calG calC calD calG calB calR calG calC calF calA calD calF);
#
# Define calendar type array for years.
my %years;
#
# Build year hash
#
$years{'1960'} = \@ytL;  $years{'1970'} = \@ytI;  $years{'1980'} = \@ytF;  $years{'1990'} = \@ytC;
$years{'1961'} = \@ytA;  $years{'1971'} = \@ytK;  $years{'1981'} = \@ytI;  $years{'1991'} = \@ytE;
$years{'1962'} = \@ytC;  $years{'1972'} = \@ytN;  $years{'1982'} = \@ytK;  $years{'1992'} = \@ytH;
$years{'1963'} = \@ytE;  $years{'1973'} = \@ytC;  $years{'1983'} = \@ytM;  $years{'1993'} = \@ytK;
$years{'1964'} = \@ytH;  $years{'1974'} = \@ytE;  $years{'1984'} = \@ytB;  $years{'1994'} = \@ytM;
$years{'1965'} = \@ytK;  $years{'1975'} = \@ytG;  $years{'1985'} = \@ytE;  $years{'1995'} = \@ytA;
$years{'1966'} = \@ytM;  $years{'1976'} = \@ytJ;  $years{'1986'} = \@ytG;  $years{'1996'} = \@ytD;
$years{'1967'} = \@ytA;  $years{'1977'} = \@ytM;  $years{'1987'} = \@ytI;  $years{'1997'} = \@ytG;
$years{'1968'} = \@ytD;  $years{'1978'} = \@ytA;  $years{'1988'} = \@ytL;  $years{'1998'} = \@ytI;
$years{'1969'} = \@ytG;  $years{'1979'} = \@ytC;  $years{'1989'} = \@ytA;  $years{'1999'} = \@ytK;
#
$years{'2000'} = \@ytN;  $years{'2010'} = \@ytK;  $years{'2020'} = \@ytH;  $years{'2030'} = \@ytE;
$years{'2001'} = \@ytC;  $years{'2011'} = \@ytM;  $years{'2021'} = \@ytK;  $years{'2031'} = \@ytG;
$years{'2002'} = \@ytE;  $years{'2012'} = \@ytB;  $years{'2022'} = \@ytM;  $years{'2032'} = \@ytJ;
$years{'2003'} = \@ytG;  $years{'2013'} = \@ytE;  $years{'2023'} = \@ytA;  $years{'2033'} = \@ytM;
$years{'2004'} = \@ytJ;  $years{'2014'} = \@ytG;  $years{'2024'} = \@ytD;  $years{'2034'} = \@ytA;
$years{'2005'} = \@ytM;  $years{'2015'} = \@ytI;  $years{'2025'} = \@ytG;  $years{'2035'} = \@ytC;
$years{'2006'} = \@ytA;  $years{'2016'} = \@ytL;  $years{'2026'} = \@ytI;  $years{'2036'} = \@ytF;
$years{'2007'} = \@ytC;  $years{'2017'} = \@ytA;  $years{'2027'} = \@ytK;  $years{'2037'} = \@ytI;
$years{'2008'} = \@ytF;  $years{'2018'} = \@ytC;  $years{'2028'} = \@ytN;  $years{'2038'} = \@ytK;
$years{'2009'} = \@ytI;  $years{'2019'} = \@ytE;  $years{'2029'} = \@ytC;  $years{'2039'} = \@ytM;
#
$years{'2040'} = \@ytB;  $years{'2050'} = \@ytM;  $years{'2060'} = \@ytJ;
$years{'2041'} = \@ytE;  $years{'2051'} = \@ytA;  $years{'2061'} = \@ytM;
$years{'2042'} = \@ytG;  $years{'2052'} = \@ytD;
$years{'2043'} = \@ytI;  $years{'2053'} = \@ytG;
$years{'2044'} = \@ytL;  $years{'2054'} = \@ytI;
$years{'2045'} = \@ytA;  $years{'2055'} = \@ytK;
$years{'2046'} = \@ytC;  $years{'2056'} = \@ytN;                            $years{'1956'} = \@ytB;
$years{'2047'} = \@ytE;  $years{'2057'} = \@ytC;                            $years{'1957'} = \@ytE;
$years{'2048'} = \@ytH;  $years{'2058'} = \@ytE;                            $years{'1958'} = \@ytG;
$years{'2049'} = \@ytK;  $years{'2059'} = \@ytG;                            $years{'1959'} = \@ytI;
#
#=========================================#
#                                         #
#    Begin main code block                #
#                                         #
#=========================================#
#
# Test for leapyear if it's February:
#if ($moNo eq 2) { my $isLeapYear = leapTest($yearNo); }
# Load month names to an array
my @monthName = qw(January February March April May June July August September October November December);
#
# If there is no year in the command line print current month and year
if (length $yearNo == 0) {
   my ($mon, $yr);
   (undef, undef, undef, undef, $mon, $yr, undef) = localtime(time() - (24*60*60));
   my $moNo = $mon+1;
   my $yearNo = $yr+1900;
   my $moCl = getMoType($moNo, $yearNo);
   printCal($years{$yearNo}[$mon], $monthName[$mon], $moCl, undef, $yearNo);
   #print "This is YR: $yr == This is YEARNO: $yearNo\n";
#
# If we're here, there is a year.
#
 } else {
if (length $moNo > 0) {
    $moPos = $moNo-1; # If there is a month, set the position in the array for the month name
}else{
    $wholeYearFlag = 1; # No month: Set to print whole year
}
if ($wholeYearFlag) {
     for ( my $i=0; $i < 12; $i++) { # Loop 12 times
             my $s = $i+1;  # set the position in the array for the month name
             my $moCl = getMoType($s, $yearNo);  # Test for how many days in the month
         printCal($years{$yearNo}[$i], $monthName[$i], $moCl, $wholeYearFlag, $yearNo); # Print iterative month
     }
}else{
        my $moCl = getMoType($moNo, $yearNo);  # Test for how many days in the month
    printCal($years{$yearNo}[$moPos], $monthName[$moPos], $moCl, $wholeYearFlag, $yearNo); # Print selected month
}
}
exit(); # all done

#=========================================#
#                                         #
#   Calendar layouts                      #
#                                         #
#=========================================#
sub lines {
my $moName = shift;
my $yearNo = shift;
my $l  = "-" x 64 . "\n";
my $title = $moName . " - " . $yearNo;
my $titleLen = length $title;
my $titSpace = 32-($titleLen/2);
my $tl = "\n" . " " x $titSpace . $title . "\n" . $l . "|   Sun  |   Mon  |   Tue  |   Wed  |   Thu  |   Fri  |   Sat  |\n" . $l;
my $v  = "|" . "        |" x 7 . "\n";
my $sp =  $v.$v.$v.$v.$l;
return ($l, $tl, $v, $sp);
}
#
sub calA {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|       1|       2|       3|       4|       5|       6|       7|\n" . $spacer;
print "|       8|       9|      10|      11|      12|      13|      14|\n" . $spacer;
print "|      15|      16|      17|      18|      19|      20|      21|\n" . $spacer;
if ($moClass == 0) {    # Default
    print "|      22|      23|      24|      25|      26|      27|      28|\n" . $spacer;
    print "|      29|      30|      31|        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
    print "|      22|      23|      24|      25|      26|      27|      28|\n" . $spacer;
    print "|      29|      30|        |        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
    print "|      22|      23|      24|      25|      26|      27|      28|\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
    print "|      22|      23|      24|      25|      26|      27|      28|\n" . $spacer;
    print "|      29|        |        |        |        |        |        |\n" . $spacer;
}
}
#
sub calB {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|        |       1|       2|       3|       4|       5|       6|\n" . $spacer;
print "|       7|       8|       9|      10|      11|      12|      13|\n" . $spacer;
print "|      14|      15|      16|      17|      18|      19|      20|\n" . $spacer;
print "|      21|      22|      23|      24|      25|      26|      27|\n" . $spacer;
if ($moClass == 0) {    # Default
print "|      28|      29|      30|      31|        |        |        |\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
print "|      28|      29|      30|        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
print "|      28|        |        |        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
print "|      28|      29|        |        |        |        |        |\n" . $spacer;
}
}
#
sub calC {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|        |        |       1|       2|       3|       4|       5|\n" . $spacer;
print "|       6|       7|       8|       9|      10|      11|      12|\n" . $spacer;
print "|      13|      14|      15|      16|      17|      18|      19|\n" . $spacer;
print "|      20|      21|      22|      23|      24|      25|      26|\n" . $spacer;
if ($moClass == 0) {    # Default
print "|      27|      28|      29|      30|      31|        |        |\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
print "|      27|      28|      29|      30|        |        |        |\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
print "|      27|      28|        |        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
print "|      27|      28|      29|        |        |        |        |\n" . $spacer;
}
}
#
sub calD {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|        |        |        |       1|       2|       3|       4|\n" . $spacer;
print "|       5|       6|       7|       8|       9|      10|      11|\n" . $spacer;
print "|      12|      13|      14|      15|      16|      17|      18|\n" . $spacer;
print "|      19|      20|      21|      22|      23|      24|      25|\n" . $spacer;
if ($moClass == 0) {    # Default
print "|      26|      27|      28|      29|      30|      31|        |\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
print "|      26|      27|      28|      29|      30|        |        |\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
print "|      26|      27|      28|        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
print "|      26|      27|      28|      29|        |        |        |\n" . $spacer;
}
}
#
sub calE {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|        |        |        |        |       1|       2|       3|\n" . $spacer;
print "|       4|       5|       6|       7|       8|       9|      10|\n" . $spacer;
print "|      11|      12|      13|      14|      15|      16|      17|\n" . $spacer;
print "|      18|      19|      20|      21|      22|      23|      24|\n" . $spacer;
if ($moClass == 0) {    # Default
print "|      25|      26|      27|      28|      29|      30|      31|\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
print "|      25|      26|      27|      28|      29|      30|        |\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
print "|      25|      26|      27|      28|        |        |        |\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
print "|      25|      26|      27|      28|      29|        |        |\n" . $spacer;
}
}
#
sub calF {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|        |        |        |        |        |       1|       2|\n" . $spacer;
print "|       3|       4|       5|       6|       7|       8|       9|\n" . $spacer;
print "|      10|      11|      12|      13|      14|      15|      16|\n" . $spacer;
print "|      17|      18|      19|      20|      21|      22|      23|\n" . $spacer;
if ($moClass == 0) {    # Default
print "|      24|      25|      26|      27|      28|      29|      30|\n" . $spacer;
print "|      31|        |        |        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
print "|      24|      25|      26|      27|      28|      29|      30|\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
print "|      24|      25|      26|      27|      28|        |        |\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
print "|      24|      25|      26|      27|      28|      29|        |\n" . $spacer;
}
}
#
sub calG {
my $month   = shift;
my $moClass = shift;
my $year    = shift;
my ($line, $topline, $vert, $spacer) = lines($month, $year);
print $topline;
print "|        |        |        |        |        |        |       1|\n" . $spacer;
print "|       2|       3|       4|       5|       6|       7|       8|\n" . $spacer;
print "|       9|      10|      11|      12|      13|      14|      15|\n" . $spacer;
print "|      16|      17|      18|      19|      20|      21|      22|\n" . $spacer;
if ($moClass == 0) {    # Default
print "|      23|      24|      25|      26|      27|      28|      29|\n" . $spacer;
print "|      30|      31|        |        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 1) { # APR, JUN, SEP, NOV
print "|      23|      24|      25|      26|      27|      28|      29|\n" . $spacer;
print "|      30|        |        |        |        |        |        |\n" . $spacer;
}
elsif ($moClass == 2) { # FEB
print "|      23|      24|      25|      26|      27|      28|        |\n" . $spacer;
}
elsif ($moClass == 3) { # Leap FEB
print "|      23|      24|      25|      26|      27|      28|      29|\n" . $spacer;
}
}
#
#=========================================#
#                                         #
#     Other Subs
#                                         #
#=========================================#
#
sub leapTest {
        #no warnings 'uninitialized';
        my $year = shift;
        if( 0 == $year % 4 and 0 != $year % 100 or 0 == $year % 400 ) { return 1; }
    else                                                                                                                  { return 0; }
}
#
sub printCal {
        my $callMe = shift;
        my $moName = shift;
        my $moType = shift;
        my $yrFlag = shift;
        my $myYear = shift;
        #if (!$yrFlag) { system "clear"; }
    if          ($callMe eq "calA") { calA($moName, $moType, $myYear);}
    elsif       ($callMe eq "calB") { calB($moName, $moType, $myYear);}
        elsif   ($callMe eq "calC") { calC($moName, $moType, $myYear);}
    elsif       ($callMe eq "calD") { calD($moName, $moType, $myYear);}
        elsif   ($callMe eq "calE") { calE($moName, $moType, $myYear);}
        elsif   ($callMe eq "calF") { calF($moName, $moType, $myYear);}
        elsif   ($callMe eq "calG") { calG($moName, $moType, $myYear);}
        else                                            {print "$callMe does not exist\n"; }
}
#
sub getMoType {
        my $month = shift;
        my $yr    = shift;
        my $leapFlag = leapTest($yr);
        my $class = 0;
        if ($month == 2) {
            if ($leapFlag)                                      { $class = 3; }
            else                                                        { $class = 2; }
    }
    elsif       ($month == 4)                           { $class = 1; }
    elsif       ($month == 6)                           { $class = 1; }
        elsif   ($month == 9)                           { $class = 1; }
        elsif   ($month == 11)                          { $class = 1; }
        else                                                            { $class = 0; }
        return $class;
}
# Done with sub declarations

