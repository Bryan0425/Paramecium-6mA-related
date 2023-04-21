#!/usr/bin/perl -w
my $dir = '/apps/users/panbo/project/Paramecium/HGT/sequences';
my $file;
my @dir;
opendir(DIR, $dir)or die "can't open the directory!";
@dir = readdir DIR;
foreach $file (@dir) {
if ( $file =~ /(\d+?\.)fasta/) {
$muscle_output=$1."alignment";
$fasttree_output=$1."tre";
system("muscle -in $file -out $muscle_output");
system("FastTree $muscle_output > $fasttree_output");
#print $file;
} else {
print "$file Not the kind of file type you want!\n";
}
}
