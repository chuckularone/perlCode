#!/usr/bin/perl

print "Enter principal amount: ";
$principal = <STDIN>;

print "Enter rate of interest: ";
$rate = <STDIN>;

print "Enter time period (in years): ";
$time = <STDIN>;

$interest_rate = $rate / 100;
$interest = $principal * $interest_rate * $time;

print "\nSimple interest is: $interest\n\n";

$monthly_interest_rate = $interest_rate / 12;
$monthly_payment = $principal / ($time * 12);

print "Amortization Schedule:\n\n";
print "Payment\tPrincipal\tInterest\tBalance\n";
print "-------\t---------\t--------\t-------\n";

$balance = $principal;
$total_payment = 0;
for ($i = 1; $i <= ($time * 12); $i++) {
    $monthly_interest = $balance * $monthly_interest_rate;
    $monthly_principal = $monthly_payment - $monthly_interest;
    $balance -= $monthly_principal;
    $total_payment += $monthly_payment;
    printf("%d\t%.2f\t\t%.2f\t\t%.2f\n", $i, $monthly_principal, $monthly_interest, $balance);
}

print "\nTotal payment: $total_payment\n";

