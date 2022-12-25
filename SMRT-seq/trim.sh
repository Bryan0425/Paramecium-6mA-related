dir=/apps/users/panbo/project/Paramecium/20220905/
cat config |while read id
do
      arr=${id}
      fq1=${arr[0]}
      fq2=${arr[1]}
      nohup trim_galore -q 30 -j 8 --gzip --phred33 --length 36 -e 0.1 --stringency 3 --paired -o $dir $fq1 $fq2 &
done

