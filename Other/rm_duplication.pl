#!/usr/bin/perl
use warnings;
use strict;
my %hash;
my $source_file=$ARGV[0]; 
my $dest_file = $ARGV[1];
open (FILE,"<$ARGV[0]") or die "Cannot open file $!\n";
open (SORTED,">$ARGV[0]_rm_dup") or die "Cannot open file $!\n";
while(defined (my $line = <FILE>))
{chomp($line);
$hash{$line} += 1;
}
foreach my $k (keys %hash) {
        print SORTED "$k\n";
        }
        close (FILE);
        close (SORTED);
