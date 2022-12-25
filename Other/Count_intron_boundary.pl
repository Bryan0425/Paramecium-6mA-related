#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[1]";
#$/=">";
$i=0;
$GTAG=0;
$CTAC=0;
my %fasta;
while (<IN>){
    if (/^\>(.+?)\n/){
            $id=$1;
	    #print $id."\n";
	    push @ID,$id;
                } else {
            chomp $_;
            $fasta{$id}.=$_;
    }
}

foreach $a (@ID){
	if($fasta{$a}=~/^GT.+?AG$/){
		$GTAG++;
		}
	elsif($fasta{$a}=~/^CT.+?AC$/){
		$CTAC++;
		}
	else{
		$i++;
		print OUT ">$a\n$fasta{$a}\n";
		}
}
print "GT-AG:$GTAG\n";
print "CT-AC:$CTAC\n";
