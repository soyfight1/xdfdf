#!/usr/bin/perl
use strict; use warnings;
my $target = "42Oz6uCfSR.SI";
while (my $w = <STDIN>) {
  chomp $w;
  if (crypt($w, "42") eq $target) { print "$w\n"; exit 0; }
}
exit 1;
