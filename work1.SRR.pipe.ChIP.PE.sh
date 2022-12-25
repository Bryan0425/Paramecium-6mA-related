ref=/apps/users/panbo/project/Paramecium/6mA-IP/02Clean_data/Pb_genome.fasta #NOTE!
in=/apps/users/panbo/project/Paramecium/6mA-IP/02Clean_data/  #change  and note the suffix of fq file
for sam in `cat sample.list`; do
echo "

fq1=\`find  -name \"$sam*_1_val_1.fq.gz\" \`
fq2=\`find  -name \"$sam*_2_val_2.fq.gz\" \`
bowtie2 -x $ref  -1 \$fq1 -2 \$fq2 -q --phred33  --very-sensitive -p 16  -S bowtie2.$sam.sam >& $sam.mapping.xls
samtools view -S -q 30 -b bowtie2.$sam.sam > bowtie2.$sam.bam
samtools sort bowtie2.$sam.bam -o  bowtie2.$sam.srt.bam
samtools rmdup bowtie2.$sam.srt.bam bowtie2.$sam.rmdup.bam
bedtools bamtobed -i bowtie2.$sam.rmdup.bam > $sam.bed
samtools index bowtie2.$sam.rmdup.bam

" > $sam.pipe.sh
nohup sh $sam.pipe.sh >& $sam.pipe.sh.log &
done
