#!/usr/bin/perl -w
open FASTA1, "<$ARGV[0]";  #bursaria
open FASTA2, "<$ARGV[1]";  #TARGET
open BLAST, "<$ARGV[2]";  #blastp output
while(<FASTA1>){
	#chomp;
	if(/^>/){
		$_=~/>(.+?)\n/;
		$id=$1;
		push @ID, $id;
		}else{
		$seq=$_;
		$fasta{$id}.=$seq;
		}
	}
while(<FASTA2>){
        #chomp;
        if(/^>/){
                $_=~/>(.+?)\s.+?\[(\S\S\S).+?/;
                $id=$1;
		$name{$id}=$2;
                }else{
                $seq=$_;
                $fasta{$id}.=$seq;
                }
        }
#%hash=[];
while(<BLAST>){
	@ar=split("\t", $_);
	$query=$ar[0];
	#print $query."\n";
	$target=$ar[1];
	if(grep /^$target$/, @{$hash{$query}}){
		}else{
		push @{$hash{$query}}, $target;
		}
	#$hash{$query}=@target;
	}
foreach $ID (@ID){
	open OUT, ">$ID.fasta";
	print OUT ">$ID\n".$fasta{$ID};
	foreach $_ (@{$hash{$ID}}){
		print OUT ">$name{$_}_$_\n".$fasta{$_};
		}
 
	}
