#!/usr/bin/perl -w
open IN, "<nr";
open IN1, "<psl1.txt";
open IN2, "<psl2.txt";
open IN3, "<psl3.txt";
open IN4, "<psl4.txt";
open IN5, "<psl5.txt";
open IN6, "<psl6.txt";
open IN7, "<psl7.txt";
open IN8, "<psl8.txt";
open IN9, "<psl9.txt";
open OUT1, ">psl1_nr";
open OUT2, ">psl2_nr";
open OUT3, ">psl3_nr";
open OUT4, ">psl4_nr";
open OUT5, ">psl5_nr";
open OUT6, ">psl6_nr";
open OUT7, ">psl7_nr";
open OUT8, ">psl8_nr";
open OUT9, ">psl9_nr";
while(<IN>){
	if($_=~/^>(.+?)\s+?/){
		$id=$_;
		$accession=$1;
		$title{$accession}=$id;
		}else{
		$fasta{$id}.=$_;
		}
	}
while(<IN1>){
	chomp;
	$a=$_;
	$des=$title{$a};
	print OUT1 $des.$fasta{$des};
	}
while(<IN2>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT2 $des.$fasta{$des};
        }
while(<IN3>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT3 $des.$fasta{$des};
        }
while(<IN4>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT4 $des.$fasta{$des};
        }
while(<IN5>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT5 $des.$fasta{$des};
        }
while(<IN6>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT6 $des.$fasta{$des};
        }
while(<IN7>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT7 $des.$fasta{$des};
        }
while(<IN8>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT8 $des.$fasta{$des};
        }
while(<IN9>){
        chomp;
        $a=$_;
        $des=$title{$a};
        print OUT9 $des.$fasta{$des};
        }


close IN1;
close IN2;
close IN3;
close IN4;
close IN5;
close IN6;
close IN7;
close IN8;
close IN9;
close OUT1;
close OUT2;
close OUT3;
close OUT4;
close OUT5;
close OUT6;
close OUT7;
close OUT8;
close OUT9;

