#!/usr/bin/perl -w
# count total and per scaffold 6mA density
# 20190308 version
open IN1, "<$ARGV[0]";  #_6mA_info FILE
open FASTA, "<$ARGV[1]";  #TGD assembly fasta
open OUT1, ">$ARGV[0]_density_per_chr";
open OUT2, ">$ARGV[0]_density_statistics3";  #calculate total 6mA (lines)/ total A from OUT1


my $d;
my $td;
my $ad;
my $p;
my $scf_len;
my $last_scaffold;
my %fasta;
my $scf;
my $line_a;
my $total_a;
my $total_t;
my $mA;

while (<FASTA>){
        if (/^\>(.+?)[\r\n\s\t]/){
                $scf=$1;
                next;
        } else {
                $_ =~ s/[\r\n\s\t]//g;
				$line_a = $_ =~ tr/A/A/;
				$line_t = $_ =~ tr/T/T/;
				$total_a += $line_a;
				$total_t += $line_t;
                $fasta{$scf} .= $_;
        }
}
close FASTA;



while (<IN1>) {
	 my $line = $_;
	 my @ar = split("\t", $_);
	 my $scaffold = $ar[0];
	 #print $scaffold;
		if($scaffold ~~ $last_scaffold){
		$d += 1;
		$last_scaffold = $scaffold;
		}else{
		if($last_scaffold){ #last one not use this way
		#print "$fasta{$last_scaffold}\n";
		$scf_len = $fasta{$last_scaffold} =~ tr/ATCG/ATCG/;
		$td = ($fasta{$last_scaffold} =~ tr/A/A/);  #assembly gff find scf and count total A 
		$ad = ($fasta{$last_scaffold} =~ tr/T/T/);  #reverse strand total A
		$p = $d / ($td + $ad);
		print OUT1 "$last_scaffold\t$d\t($td+$ad)\t$p\t$scf_len\n";
		$mA += $d;  #total 6mA count
		$last_scaffold = $scaffold;
		$d = 1;
		}else{
		$last_scaffold = $scaffold;
		$d = 1;}  #6mA count
		}
	}
#For the last one scaffold:
#print "$fasta{$last_scaffold}";
#print "$last_scaffold\n";
$scf_len = $fasta{$last_scaffold} =~ tr/ATCG/ATCG/;
$td = ($fasta{$last_scaffold} =~ tr/A/A/);
$ad = ($fasta{$last_scaffold} =~ tr/T/T/);
$p = $d / ($td + $ad);
$mA += $d;
$total_p = $mA / ($total_a + $total_t);

print OUT1 "$last_scaffold\t$d\t($td+$ad)\t$p\t$scf_len\n";
print OUT2 "6mA:$mA\nTotal A:($total_a+$total_t)\n6mA density:$total_p\n";


close IN1;
close OUT1;
