#!/usr/bin/perl
use strict;
use warnings;
use WWW::Mechanize;
use File::Slurp;
use Email::Sender::Simple qw(sendmail);
use Email::Simple;
use Email::Simple::Creator;

# URL of the webpage to scrape
my $url = 'https://50legs.org/application-for-assistance/';

# Initialize WWW::Mechanize
my $mech = WWW::Mechanize->new();
$mech->get($url);

# Check if the page contains the target text
my $content = $mech->content();
if ($content =~ /WE ARE NOT CURRENTLY ACCEPTING NEW APPLICATIONS\./) {
    # Output to the screen
    print "The text is present on the page.\n";

    # Write to a file
    write_file('out.txt', {append => 1}, "The text is present on the page.\n");

    # Send an email
    my $email = Email::Simple->create(
        header => [
            To      => 'chuck@mckenna.tv',
            From    => 'your@email.com',
            Subject => 'TEXT FOUND ON 50LEGS.ORG',
            'X-Priority' => 1,  # High priority
        ],
        body => "The text 'WE ARE NOT CURRENTLY ACCEPTING NEW APPLICATIONS.' was found on the page.",
    );
    sendmail($email);
} else {
    # Output to the screen
    print "The text is not present on the page.\n";

    # Write to a file
    write_file('out.txt', {append => 1}, "The text is not present on the page.\n");

    # Send an email
    my $email = Email::Simple->create(
        header => [
            To      => 'chuck@mckenna.tv',
            From    => 'your@email.com',
            Subject => 'TEXT NOT FOUND ON 50LEGS.ORG',
            'X-Priority' => 1,  # High priority
        ],
        body => "The text 'WE ARE NOT CURRENTLY ACCEPTING NEW APPLICATIONS.' was not found on the page.",
    );
    sendmail($email);
}
