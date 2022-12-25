#!/usr/bin/perl -w
use strict;
use Getopt::Long;
my ($infile,$outfile,$list,$help);
GetOptions(
	"i|input=s"=>\$infile,
	"l|list=s"=>\$list,
	"o|out=s"=>\$outfile,
	"h|help:s"=>\$help,
);
($infile && -s $infile)||$help||die & Usage();

open IN, $list || die "Can't open file $list!";
my %listids;
while (<IN>){
	chomp;
	$listids{$_}=1;
}
close IN;
$/=">";
open IN, $infile||die $!;
<IN>;
open OUT,">$outfile"||die $!;
while(<IN>){
	chomp;
	s/^\s+//g;
	my $id;
	$id=$1 if(/^(\S+)/);
	print OUT ">$_",if($listids{$id});
}
close IN;
close OUT;
$/="\n";

sub Usage{
	my $info="
	Usage:perl $0 -i <infile> -l <genlist> -o <outfile>
Options:
	-i|input <str> set input fa file
	-l|list <str> inputfa id list seperated by '\\n'
	-o|out <str> set outfile file
	-h|help set outfile file
";
	print $info;
	exit 0;	
}