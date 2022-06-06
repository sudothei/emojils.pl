#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use XML::Simple;
use Data::Dumper;
binmode(STDOUT, "encoding(UTF-8)");

my $xml = new XML::Simple;
my $emojis = $xml->XMLin("./en.xml");
my $annotations = $emojis->{annotations}->{annotation};

sub make_tagfile {
    open(my $out, ">",  "./tags.txt") or die "Can't open output.txt: $!";
    for my $annotation (@$annotations) {
        my @content = split / \| /, $annotation->{'content'};
        my $cp = $annotation->{'cp'};
        for my $tag (@content) {
            print $out "$tag : ${cp}\n"
        }
    };
    `sort -uo tags.txt tags.txt`
};

make_tagfile();
