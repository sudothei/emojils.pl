#!/usr/bin/perl

use strict;
use warnings;
use utf8;
use Data::Dumper;
binmode(STDOUT, "encoding(UTF-8)");

my %launchers = (
dmenu => "dmenu",
rofi => "rofi -dmenu -i -p emoji -matching normal -sort -sorting-method fzf",
);
my $launcher = $launchers{( $ARGV[0] )};

my $emoji = `cat /usr/local/bin/emojilstags.txt | ${launcher}`;
$emoji =~ s/.* : //g;
chomp $emoji;
system("echo -n ${emoji} | xclip -selection c")
