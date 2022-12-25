#!/usr/bin/perl -w
open IN, "<nr";
open IN1, "<$ARGV[0]";
open OUT1, ">$ARGV[0]_nr";
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
close IN;
close IN1;
close OUT1;
