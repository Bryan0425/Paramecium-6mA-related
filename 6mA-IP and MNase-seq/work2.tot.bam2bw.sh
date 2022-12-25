cat sample.list| while read name;do echo "
alignmentSieve -b bowtie2.$name.rmdup.bam --minFragmentLength 100 --maxFragmentLength 500 -o $name.frag.100-500.bam --filterMetrics $name.metrics.txt
samtools index  $name.frag.100-500.bam 
bamCoverage --outFileFormat bigwig --ignoreForNormalization chrM chrX chrY --skipNAs --bam $name.frag.100-500.bam --outFileName $name.frag.100-500.bigwig --normalizeUsing RPGC --effectiveGenomeSize 29000000  --binSize 1 --ignoreDuplicates -p 16
" > $name.bam2bw.sh
nohup sh $name.bam2bw.sh >& $name.bam2bw.sh.log &
done
