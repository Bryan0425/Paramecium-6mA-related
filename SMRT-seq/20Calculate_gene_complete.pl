#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
while(<IN>){
	@ar=split("\t",$_);
	$type=$ar[2];
	#print $type."\n";
	#$ar[8]=~/gene_id "(.+?)";/;
	#$gene=$1;
	if($type eq "start_codon"){
		$ar[8]=~/gene_id "g(.+?)";/;
        	$gene=$1;
		$hash1{$gene}=1;
		#print "taet\n";
		}elsif($type eq "stop_codon"){
		$ar[8]=~/gene_id "g(.+?)";/;
        	$gene=$1;
		$hash2{$gene}=2;
		}else{
		
		}
	}
foreach $num (1..17825){
	#$GENE="g$num";
	if($hash1{$num} and $hash2{$num}){
		$completed+=1;
		}elsif($hash1{$num}){
		$start+=1;
		}elsif($hash2{$num}){
		$end+=1;
		}else{
		$non+=1;
		}
	}
print "completed:$completed\n";
print "start:$start\n";
print "end:$end\n";
print "non:$non\n";
