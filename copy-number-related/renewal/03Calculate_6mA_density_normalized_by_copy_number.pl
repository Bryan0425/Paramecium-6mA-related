#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #copy number
open IN2, "<$ARGV[1]";  #chr legth
open IN3, "<$ARGV[2]";  #6mA density
open OUT, ">$ARGV[3]";
while(<IN1>){
	chomp;
	next if $_=~/chr/;
	@ar=split("\t",$_);
	$chr=$ar[0];
	$copy=$ar[1];
	$hash{$chr}=$copy;
}
while(<IN2>){
        chomp;
        next if $_=~/chr/;
        @ar2=split("\t",$_);
        $scf=$ar2[0];
        $length=$ar2[1];
        $hash2{$scf}=$length;
}
while(<IN3>){
        chomp;
	next if $_=~/chr/;
        @ar3=split("\t",$_);
        $contig=$ar3[0];
        $density=$ar3[1];
        if($hash{$contig}){
	$normalization=$density/$hash{$contig}*10000;
	print OUT $contig."\t".$normalization."\t".$hash2{$contig}."\n";
	}
	#$hash{$chr}=$copy;
}
