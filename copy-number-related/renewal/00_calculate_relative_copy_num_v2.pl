#!/usr/bin/perl -w
open IN, "<$ARGV[0]"; #gene bed
open IN2, "<$ARGV[1]";  #depth
open OUT, ">$ARGV[2]";
while(<IN2>){
        chomp;
        @ar2=split("\t", $_);
        $scf=$ar2[0];
        $site=$ar2[1];
        $num=$ar2[2];
        $label="$scf\t$site";
        $hash{$label}=$num;
        }
while(<IN>){
        @ar=split("\t", $_);
        $chr=$ar[0];
        $start=$ar[1];
        $end=$ar[2];
        $ar[3]=~/"(.+?)"/;
        $name=$1;
	push @gene, $name;
        $len{$name}=$end-$start+1;
        $j=$start;
        for($j; $j <= $end; $j+=1){
                $sum="$chr\t$j";
                $hash2{$name}+=$hash{$sum};
                }
        print "$name: $hash2{$name}\n";
        }
foreach $gene (@gene){
        $copy=$hash2{$gene}/$len{$gene}/$len{$gene};
        print OUT "$gene\t$hash2{$gene}\t$len{$gene}\t$copy\n";
        }
close IN;
close IN2;
close OUT;
