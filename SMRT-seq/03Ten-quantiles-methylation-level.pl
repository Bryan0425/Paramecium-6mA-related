#!/usr/bin/perl -w
# 160X data count 6mA sites
# 20190302 version
open IN, "<$ARGV[0]";
open OUT1, ">$ARGV[0]_Q1";
open OUT2, ">$ARGV[0]_Q2";
open OUT3, ">$ARGV[0]_Q3";
open OUT4, ">$ARGV[0]_Q4";
open OUT5, ">$ARGV[0]_Q5";
open OUT6, ">$ARGV[0]_Q6";
open OUT7, ">$ARGV[0]_Q7";
open OUT8, ">$ARGV[0]_Q8";
open OUT9, ">$ARGV[0]_Q9";
open OUT10, ">$ARGV[0]_Q10";
$n = 0;
$l = 0;
$i1 = 0;
$i2 = 0;
$i3 = 0;
$i4 = 0;
$i5 = 0;
$i6 = 0;
$h1 = 0;
$h2 = 0;
$non = 0;

while (<IN>) {
	 next if /^#/;
	 my @ar = split("\t", $_);
	 my $line = $_;
	 #my $seqid = $ar[0];
	 #my $source = $ar[1];
	 my $type = $ar[2];
	 #my $start = $ar[3];
	 #my $end = $ar[4];
	 #my $score = $ar[5];
	 #my $strand = $ar[6];
	 my $attribute = $ar[8];	 #context=TTTATTTACAGATAATTGGTATTACCCCAGCTAAAAATAGA;fracLow=0.06;coverage=105;IPDRatio=1.55;fracUp=0.25;frac=0.15;identificationQv=13
	 if ($type ~~ /m6A/) {
		#print "Bingo!\n";
		if($attribute ~~ /coverage\=(\d+);(.+)frac\=(\d.\d+);.+identificationQv\=(\d+)/){  #\d:digital
			$coverage = $1;
			$frac = $3;
			$identificationQv = $4;
			
			if ($coverage > 100 && $identificationQv > 30) {  
				#coverage calculation：total coverage/100(genome)*25(modification)
				#Pb:123.88X---30.97 
				$n += 1;  #count
				#print OUT1 $_;  #save 6mA GFF
				
				if ($frac > 0.1 && $frac <= 0.2){
				$l += 1;
				print OUT2 $line;}  #low 10–20%
				elsif($frac > 0.2 && $frac <= 0.3){
				$i1 += 1;
				print OUT3 $line;}
				elsif ($frac > 0.3 && $frac <= 0.4){
				$i2 += 1;
				print OUT4 $line;}
				elsif ($frac > 0.4 && $frac <= 0.5){
				$i3 += 1;
				print OUT5 $line;}
				elsif ($frac > 0.5 && $frac <= 0.6){
				$i4 += 1;
				print OUT6 $line;}
				elsif ($frac > 0.6 && $frac <= 0.7){
				$i5 += 1;
				print OUT7 $line;}
				elsif ($frac > 0.7 && $frac <= 0.8){
				$i6 += 1;
				print OUT8 $line;}  #intermediate 20–80%
				elsif ($frac > 0.8 && $frac <= 0.9){
				$h1 += 1;
				print OUT9 $line;}  #high 80–100%
				elsif ($frac > 0.9 && $frac <= 1.0){
				$h2 += 1;
				print OUT10 $line;}
				else{
				$non +=1;
				print OUT1 $line;
				}  #non-sense sites
				#if ($strand = "-") {
				#	$context = reverse $context;
				#	$context =~ tr/GATC/CTAG/;
				#}
				}
			}
				#print OUT "$seqid\t$start\t$end\t$strand\t$context\t";
		}	

		
	}

$i = $i1 + $i2 + $i3 + $i4 + $i5 + $i6;
$h = $h1 + $h2;
$lp = $l/$n;
$ip = $i/$n;
$hp = $h/$n;
print   "6mA Frequency: $n\nLowly:$l\t$lp\nIntermediately:$i\t$ip\nHighly:$h\t$hp\n";
print   "0-10%:$non\n10%-20%:$l\n20%-30%:$i1\n30%-40%:$i2\n40%-50%:$i3\n50%-60%:$i4\n60%-70%:$i5\n70%-80%:$i6\n80%-90%:$h1\n90%-100%:$h2\n";
	 
close IN;
close OUT1;
close OUT2;
close OUT3;
close OUT4;
close OUT5;
