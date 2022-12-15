#!/usr/bin/perl
use strict;
open IN, "<$ARGV[0]";  #FASTA
open OUT, ">$ARGV[0]_GC_content";
my %GC_content; # id=>GC 哈希存放id和GC数
my %sequences; # id=>sequence 哈希存放id和碱基数
my ($id, $base_sum, $GC_sum, $p_gc, $p_at); # id, 碱基数，GC数
my @num; # 中间变量，用于存储单行中某字符数

while(my $seq = <IN>)
# <>一行行读给$seq
{
    chomp($seq);  # 去掉字符串末尾的\n

    if($seq =~ m/^>(.*)/)  # 若该行以“>”开头
    {
        $id = $1;  # $1就是第一对小括号中的原符号所对应的匹配内容。
        next;  # ↓
    }

    @num = ($seq =~ m/(G|C)/g);
    $GC_content{$id} += @num;  # 统计该id序列的GC总数
    $GC_sum += @num;  # 统计该文件的GC总数

    @num = ($seq =~ m/(.)/g);
    $sequences{$id} += @num;  # 统计该id序列的碱基总数
    $base_sum += @num;   # 统计该文件的碱基总数
}


foreach(keys(%GC_content))  # 遍历哈希
{
    if(($GC_content{$_} / $sequences{$_}) >= ($GC_sum / $base_sum))
    # 比较某序列GC含量与总文件GC含量的大小
    {
        printf OUT ("%s\t%.6f\tmore\n", $_, $GC_content{$_} / $sequences{$_});
        # 如果“>=”，打印该序列的：id，GC含量，more
    }
    else
    {
        printf OUT ("%s\t%.6f\tsmall\n", $_, $GC_content{$_} / $sequences{$_});
        # 如果“<”，打印该序列的：id，GC含量，less
    }
}
$p_gc=$GC_sum/$base_sum;
$p_at=1-$p_gc;
print "GC content: $p_gc\nAT content: $p_at\n"
