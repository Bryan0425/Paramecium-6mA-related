#!/usr/bin/perl -w

=head1 Name

	id2fasta.pl -- Find sequence in fasta format according to seq id.

=head1 Description

	This script was designed to Find sequence in fasta format according to seq id.

=head1 Version

	Author: Xiao Chen, seanchen607@gmail.com
	Version: 1.0 Date: 2015/6/6

=head1 Usage

	perl id2fasta.pl <input_fasta> <id_file> <output_fasta>

=head1 Example
  
	perl id2fasta.pl  T_thermophila_June2014_gene.fasta  EZL2KO_CU428_5X_g.genelist  EZL2KO_CU428_5X_g.fasta

=cut

use strict;
die `pod2text $0` if (@ARGV lt 3);


print STDERR "\nLoading T_thermophila gene sequences in fasta format...\n";
open FASTA,$ARGV[0];

my %fasta;
my $id;

while (<FASTA>){
	if (/^\>/){
		$id=$_;
		$id=~/^\>(.+?\t.+?\t.+?)\t/;
		$id=$1;
		next;
	} else {
		chomp $_;
		$fasta{$id}.=$_;
	}
}
close FASTA;

########################################################################
print STDERR "\nLoading id list...\n";
open ID,$ARGV[1];

print STDERR "\nOutputing target fasta information...\n";
open OUT,">$ARGV[2]";

while (<ID>){
	if (/(.+?\t.+?\t.+?)\t/ && $fasta{$1}){
		print OUT ">$1\n" . $fasta{$1} .  "\n";
	}
}
close ID;

########################################################################


print STDERR "\nDone!\n";
