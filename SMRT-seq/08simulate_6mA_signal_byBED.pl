#!/usr/bin/perl -w

=head1 Name

	07simulate_6mA_signal_byBED.pl

=head1 Description

	This script was designed to simulate the 6mA signal by random location on genome from BED file.

=head1 Version

	Author: Xiao Chen, seanchen607@gmail.com
	Version: 1.0 Date: 2016/11/22

=head1 Usage

	perl 07simulate_6mA_signal_byBED.pl  <scafford_size_info_file>  <Input_BED_file>  <Output_BED_file>

=head1 Example
  
	perl 07simulate_6mA_signal_byBED.pl  T_thermophila_chrom.sizes.txt  modifications.gff_m6A.bed  modifications.gff_m6A_simulated.bed

=cut

use strict;
die `pod2text $0` unless (@ARGV == 3);


########################################################################
print STDERR "\nLoading size information of each scaffold...\n";

my %scaffold_size;
open SIZE, $ARGV[0];
foreach (<SIZE>) {
	if (/(.+?)\t(.+?)[\r\n]/) {
		$scaffold_size{$1} = $2;
	}
}
# print STDOUT $lines_total . "\n";
close SIZE;


########################################################################
print STDERR "\nSimulating 6mA signals from BED file...\n";

############ Show Progress ############
my $lines_total=0;
open BED, $ARGV[1];
foreach (<BED>) {
	$lines_total++;
}
# print STDOUT $lines_total . "\n";
close BED;
my $lines=0;
my $percent2=0;
#######################################

open BED, $ARGV[1];
open OUT1, ">$ARGV[2]";

# ################################ Sorting Input ##################################
# my @splits = map { [split /\t/] } <BED>;
# close BED;
# my @lines = sort { $a->[0] cmp $b->[0] or $a->[3] <=> $b->[3] } @splits;
# my @sorted;

# foreach my $line (@lines) {
	# my $sorted = join "\t", @$line;
	# push @sorted, $sorted;
# }
# #################################################################################

srand(time());
my %flag;

# foreach (@sorted){
while (<BED>) {
	############ Show Progress ############
	$lines++;
	my $percent=int(100*$lines/$lines_total);
	if ($percent2<$percent){
		$percent2=$percent;
		print STDOUT "$percent2\%\n";
	}
	#######################################
	
	my @ar = split /\t/, $_;
	my $range = $scaffold_size{$ar[0]};
	my $num;
	my $position;
	do {
		$num = int(rand($range));
		$position = $ar[0] . "_" . $num;
	} while ($flag{$position});
	$flag{$position} = 1;
	$ar[1] = $num + 1;
	$ar[2] = $ar[1];
	
	if (rand()>0.5) {
		$ar[5] = "+\n";
	} elsif (rand()<0.5) {
		$ar[5] = "-\n";
	}
	
	my $newline = join "\t", @ar;
	print OUT1 $newline;
}

########################################################################

print STDERR "\nDone!\n";
