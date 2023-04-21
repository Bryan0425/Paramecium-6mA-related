#!/usr/bin/perl -w
my $dir = '/apps/users/panbo/project/Paramecium/HGT/sequences';
my $file;
my @dir;
opendir(DIR, $dir)or die "can't open the directory!";
@dir = readdir DIR;
foreach $file (@dir) {
	if($file=~/(\d+?\.)tre/){
		open IN, "<$file";
		while(<IN>){
		$line=$_;
		#print $line;
		if($line=~/Chl/ and $line=~/Par/){
			open OUT, ">>HGT_candidates";
			print OUT $file."\n";
			}elsif($line=~/Chl/ and not $line=~/Par/){
			open OUT, ">>HGT_true";
        		print OUT $file."\n";
			}elsif($line=~/Par/ and not $line=~/Chl/){
        		open OUT, ">>HGT_false";
        		print OUT $file."\n";	
			}
		}
		}else{
		#print "$file Not the kind of file type you want!\n";
		}
	}

