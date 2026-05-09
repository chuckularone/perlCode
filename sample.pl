#!/usr/bin/perl

use SQLite::DB;
 
my $db = SQLite::DB->new('stuff.db');
 
$db->connect;
$db->select("select * from table",{}) || print $db->get_error."\n";
$result = $db->select_one_row("select max(field) as total FROM table");
 
print $$result{TOTAL};
 
$db->transaction_mode;
 
if (!ref $resultset) {
  print $db->get_error."\n"
} else {
  for (@$resultset) {
    print $resultset->[$_]->{id}." - ".$resultset->[$_]->{value}."\n";
  }
}
 
$db->disconnect;
