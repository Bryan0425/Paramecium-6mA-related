#!/usr/bin/perl -w
my $dir = '/apps/users/panbo/project/Paramecium/HGT/sequences';
my $file;
my @dir;
opendir(DIR, $dir)or die "can't open the directory!";
@dir = readdir DIR;
foreach $file (@dir) {
	if($file=~/(\d+?)\.tre/){
		$id=$1;
		open IN, "<$file";
		while(<IN>){
		$line=$_;
		#print $line;
		#if($line=~/Chl/ and $line=~/Par/){
		#	open OUT, ">>HGT_candidates";
		#	print OUT $file."\n";
		#	}elsif($line=~/Chl/ and not $line=~/Par/){
		#	open OUT, ">>HGT_true";
        	#	print OUT $file."\n";
		#	}elsif($line=~/Par/ and not $line=~/Chl/){
        	#	open OUT, ">>HGT_false";
        	#	print OUT $file."\n";	
		#	}
		if($line=~/\(Chl_.+?:.+?,$id:.+?\)/){
			open OUT, ">>HGT_tree_true";
			print OUT $file."\n";
			}elsif($line=~/\($id:.+?,Chl_.+?:.+?\)/){
			open OUT, ">>HGT_tree_true";
                        print OUT $file."\n";
			}  #(Chl_XP_005843763.1:0.81183,5092:0.43019)


		}
		}else{
		#print "$file Not the kind of file type you want!\n";
		}
	}

