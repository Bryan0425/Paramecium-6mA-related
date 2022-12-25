#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #genome fasta
open LIST, "<$ARGV[1]";  #intron gff
open OUT, ">$ARGV[1].fasta";
my %fasta;
while (<IN>){
    if (/^\>(.+?)[\t\s\r]/){
            $id=$1;
            #print $id."\n";
	    #next;
    } else {
            chomp $_;
            $fasta{$id}.=$_;
	    #print $fasta{$id}."\n";
    }
}
#$i=1;
while (<LIST>) {
	chomp;
	@line=split("\t",$_);
	$scf=$line[0];
	$scf=~s/^\s//g;
	#print $scf."\n";
	if($line[2] eq "gene"){
	$start=$line[3];
	$end=$line[4];
	$ori=$line[6];
	$name=$line[8];
	#$gene="intron".$i;
	#$i++;
	#print $fasta{$scf}."\n";
	if($fasta{$scf}){
	my $seq=substr($fasta{$scf},$start-1,$end-$start+1);
	$gene=$name;
        #$i++;
	if($ori eq "+"){
	print OUT ">$gene\n$seq\n";
	}
	if($ori eq "-"){
	$seq=~tr/atcgATCG/tagcTAGC/;
	my $rev=reverse$seq;
	print OUT ">$gene\n$rev\n";
	}
}

}
}

close IN;
close LIST;
close OUT
