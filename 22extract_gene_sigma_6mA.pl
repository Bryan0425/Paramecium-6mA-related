#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #gff
open IN2, "<$ARGV[1]";  #6mA
open OUT, ">$ARGV[2]";  #
{
        @bed=<IN2>;
        close IN2;
}
$i=0;
while (<IN1>) {
    #$_=~/(chr_\d+?)\t.+?gene\t(\d+?)\t(\d+?)\t.+?\t(.)\t.+?Name=(TTHERM_.+?);.+?\n/;
    	@ar=split("\t", $_);
	$chr=$ar[0];
	$start=$ar[3];
	$end=$ar[4];
	$gene=$ar[8];
	$gene=~s/\n//g;
        $hash{$gene}=0;
        #$s{$gene}=$start;
        #$e{$gene}=$end;
        @new_bed=();
    foreach $bed (@bed){
        $bed=~/(GWHAAFB\d+?)\t.+?\t.+?\t(\d+?)\t.+?\t.+?frac=(.+?);/;
        $contig=$1;
        $location=$2;
	$level=$3;
	#$context=~/frac=(.+?);/;
	
        if ($contig eq $chr) {
                if ($location>=$start and $location<=$end) {
                        $hash{$gene}+=$level;
                }else{
                        push @new_bed, $bed;
                }
        }else{
                push @new_bed, $bed;
        }
    }
    @bed=@new_bed;
    $len2=@bed;
    print $len2."\n";
        $i++;
        if($i==5000){
                print "20% completed!\n";
        }elsif($i==10000){
                print "40% completed!\n";
        }elsif($i==15000){
                print "60% completed!\n";
        }elsif($i==20000){
                print "80% completed!\n";
        }elsif($i==25000){
                print "100% completed!\nWaiting for printing out!\n";
        }

}
@keys=keys(%hash);
foreach $keys (@keys){
        print OUT $keys."\t".$hash{$keys}."\n";
}
