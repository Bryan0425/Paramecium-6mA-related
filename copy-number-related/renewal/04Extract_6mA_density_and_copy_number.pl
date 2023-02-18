#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #copy number
#open IN2, "<$ARGV[1]";  #chr legth
open IN3, "<$ARGV[1]";  #6mA density
open OUT, ">$ARGV[0]_with_6mA_density";
while(<IN3>){
	chomp;
	next if $_=~/chr/;
	@ar=split("\t",$_);
	$chr=$ar[0];
	$density=$ar[1];
	$hash{$chr}=$density;
}
#while(<IN2>){
 #       chomp;
  #      next if $_=~/chr/;
   #     @ar2=split("\t",$_);
    #    $scf=$ar2[0];
     #   $length=$ar2[1];
      #  $hash2{$scf}=$length;
#}
while(<IN1>){
        chomp;
	next if $_=~/chr/;
        @ar3=split("\t",$_);
        $contig=$ar3[0];
        $read=$ar3[1];
	$length=$ar3[2];
        if($hash{$contig}){
	#$normalization=$density/$hash{$contig}*10000;
	print OUT $contig."\t".$read."\t".$length."\t".$hash{$contig}."\n";
	}
	#$hash{$chr}=$copy;
}
