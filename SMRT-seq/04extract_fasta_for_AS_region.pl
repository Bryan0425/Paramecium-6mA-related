#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #genome fasta
open LIST, "<$ARGV[1]";  #gene boundary(GWHAAFB00000002        3617    4616    g27)
open OUT, ">$ARGV[1].fasta";
my %fasta;
while (<IN>){
    if (/^\>(.+?)[\t\s\r\n]/){
                $id=$1;
    } else {
            chomp $_;
            $fasta{$id}.=$_;
    }
}
#$i=1;
while (<LIST>) {
        chomp;
        @line=split("\t",$_);
        $scf=$line[0];
        #$scf=~s/^\s//g;
        $start=$line[3];
        $end=$line[4];
	$_=~/ID=(intergenic_region\d+)/;
        $gene=$1;
        my $seq=substr($fasta{$scf},$start-1,$end-$start+1);
        print OUT ">$gene\n$seq\n";
	#$i++;
}

close IN;
close LIST;
close OUT;
