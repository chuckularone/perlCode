#!/usr/bin/perl
use strict;
use File::Copy;

if ($#ARGV < 2){
    print "\nUSAGE: sqlAdd.pl weatherValue dbName dbTable \n\n";
} else {
my $weatherValue  = shift;
my $dbName    = shift;
my $dbTable   = shift;
my $sqlite    = "/usr/bin/sqlite3";
my $nowtime   = timeStamp();
#my $nowtime   = shift;
my $nowdate   = dateStamp();
#my $nowdate   = shift;

my $command  = "$sqlite $dbName \"insert into $dbTable values ('$nowdate', '$nowtime', $weatherValue)\"\;";
print "$command\n\n";
my $dumpVals = `$command`;
print $dumpVals;

}
sub dateStamp {
    my $ds;
    (my $mday, my $mon, my $year,my $wday) = (localtime(time))[3,4,5,6];
    $year += 1900;
    $mon += 1;
    my $ds = sprintf("%04d%02d%02d",$year,$mon,$mday);
    print "$ds\n";
    return $ds;
}

sub timeStamp {
    my $ts;
    (my $sec, my $min, my $hour) = (localtime(time))[0,1,2];
    my $ts = sprintf("%02d:%02d:%02d",$hour,$min,$sec);
    print "$ts\n";
    return $ts;
}

