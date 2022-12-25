#!/usr/bin/perl -w

=head1 Name

	generate_intergenic_region_gff3.pl

=head1 Description

	This script was designed to generate a new gff3 format file containing intergenic region information based on a sorted gff3 format file.

=head1 Version

	Author: Xiao Chen, seanchen607@gmail.com
	Version: 1.0 Date: 2016/11/21

=head1 Usage

	perl generate_intergenic_region_gff3.pl  <GFF3_input>  <GFF3_output>

=head1 Example
  
	perl generate_intergenic_region_gff3.pl  T_thermophila_June2014.gff3  T_thermophila_June2014_with_intergenic.gff3

=cut

use strict;
die `pod2text $0` unless (@ARGV == 2);
my $file1 = $ARGV[0];
my $file2 = $ARGV[1];

print STDERR "\nAdding intergenic region information to gff3 file...\n";
open(IN, $file1) or die "Cannot open file:$!";

############ Show Progress ############
my $lines_total = 0;
my $lines = 0;
my $percent2 =0;
foreach (<IN>) {
	$lines_total++;
}
close IN;
#######################################

open(OUT1, ">$file2") or die "Cannot output to file:$!";
open(IN, $file1) or die "Cannot open file:$!";

my $last_scf;
my $last_end;
my $scf_len;
my $last_scf_len;
my $intergenic_num = 1;
my $flag_start = 0;

while (<IN>) {
	############ Show Progress ############
	$lines++;
	my $percent=int(100*$lines/$lines_total);
	if ($percent2<$percent){
		$percent2=$percent;
		print STDERR "$percent2\%\n";
	}
	#######################################
	my $line = $_;

	my @ar = split /\t/, $_;
	my $scf = $ar[0];
	
	
	if ($ar[2] =~ /contig/i or $ar[2] =~ /scaffold/i) {
		$scf_len = $ar[4];
		if (($last_scf or eof) and $last_end < $last_scf_len) {        ################### Last intergenic region of each scaffold
			$ar[0] = $last_scf;
			$ar[2] = "intergenic_region";
			$ar[3] = $last_end+1;
			$ar[4] = $last_scf_len;
			$ar[5] = ".";
			$ar[6] = ".";
			$ar[7] = ".";
			$ar[8] = "ID=intergenic_region$intergenic_num\n";
			my $newline = join "\t", @ar;
			print OUT1 $newline;
			$intergenic_num++;
		}
		$last_scf_len = $scf_len;
		$flag_start = 0;
	}
	if ($ar[2] =~ /gene/i) {
		my $start = $ar[3];
		my $end = $ar[4];
		if (!$flag_start and $start > 1) {      ################### 1st intergenic region of each scaffold
			$ar[2] = "intergenic_region";
			$ar[4] = $start-1;
			$ar[3] = 1;
			$ar[5] = ".";
			$ar[6] = ".";
			$ar[7] = ".";
			$ar[8] = "ID=intergenic_region$intergenic_num\n";
			my $newline = join "\t", @ar;
			print OUT1 $newline;
			$intergenic_num++;
		} elsif ($last_scf and $last_scf eq $scf and $start-1 > $last_end) {
			$ar[2] = "intergenic_region";
			$ar[3] = $last_end+1;
			$ar[4] = $start-1;
			$ar[5] = ".";
			$ar[6] = ".";
			$ar[7] = ".";
			$ar[8] = "ID=intergenic_region$intergenic_num\n";
			my $newline = join "\t", @ar;
			print OUT1 $newline;
			$intergenic_num++;
		}
		$last_scf = $scf;
		$last_end = $end;
		$flag_start = 1;
	}
	
	print OUT1 $line;
}

#######################################################################

print STDERR "\nJob finished!\n";

#######################################################################

