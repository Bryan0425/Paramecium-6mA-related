#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #IR
open IN2, "<$ARGV[1]";  #normal
open IN3, "<$ARGV[2]";  #compare
open OUT, ">$ARGV[2].info";
while(<IN1>){
	chomp;
	@ar=split("\t", $_);
	$g=$ar[0];
	$a=$ar[2];
	$r=$ar[4];
	$c=$ar[6];
	$hash1{$g}+=$a;
	$hash2{$g}+=$r;
	$hashn{$g}+=1;
	$hashc{$g}=$c;
	}
while(<IN2>){
        chomp;
        @ar2=split("\t", $_);
        $g2=$ar2[0];
        $a2=$ar2[2];
        $r2=$ar2[4];
        $c2=$ar2[6];
        $hash12{$g2}+=$a2;
        $hash22{$g2}+=$r2;
        $hashn2{$g2}+=1;
        $hashc2{$g2}=$c2;
        }
print OUT "gene\tIR_amount\tIR_ratio\tIR_copy\tNM_amount\tNM_ratio\tNM_copy\n";
while(<IN3>){
	chomp;
	$m_a=$hash1{$_}/$hashn{$_};
	$m_r=$hash2{$_}/$hashn{$_};
	$m_a2=$hash12{$_}/$hashn2{$_};
        $m_r2=$hash22{$_}/$hashn2{$_};
	print OUT "$_\t$m_a\t$m_r\t$hashc{$_}\t$m_a2\t$m_r2\t$hashc2{$_}\n";
	}
