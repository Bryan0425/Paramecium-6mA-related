
bamCoverage --bam RNAi-input_all_sorted_rmdup.bam -o RNAi-input_all_sorted_rmdup.bigwig  --binSize 10  --normalizeUsing RPGC --effectiveGenomeSize 29000000 --minFragmentLength 100 --maxFragmentLength 500  &
bamCoverage --bam RNAi-IP_all_sorted_rmdup.bam -o RNAi-IP_all_sorted_rmdup.bigwig         --binSize 10 --normalizeUsing RPGC --effectiveGenomeSize 29000000 --minFragmentLength 100 --maxFragmentLength 500 &

bamCoverage --bam WT-input_all_sorted_rmdup.bam -o WT-input_all_sorted_rmdup.bigwig  --binSize 10 --extendReads --normalizeUsing RPGC --effectiveGenomeSize 29000000 --minFragmentLength 100 --maxFragmentLength 500 &
bamCoverage --bam WT-IP_all_sorted_rmdup.bam -o WT-IP_all_sorted_rmdup.bigwig  --binSize 10 --extendReads --normalizeUsing RPGC --effectiveGenomeSize 29000000 --minFragmentLength 100 --maxFragmentLength 500 &

wait

bigwigCompare -b1  WT-IP_all_sorted_rmdup.bigwig -b2  WT-input_all_sorted_rmdup.bigwig --outFileFormat bigwig --operation ratio --skipZeroOverZero --pseudocount 1 1  --skipNAs --binSize 1 --numberOfProcessors 16 -o  WT_log2ratio.bw &

bigwigCompare -b1  RNAi-IP_all_sorted_rmdup.bigwig -b2  RNAi-input_all_sorted_rmdup.bigwig --outFileFormat bigwig --operation ratio --skipZeroOverZero --pseudocount 1 1  --skipNAs --binSize 1 --numberOfProcessors 16 -o  RNAi_log2ratio.bw &

wait

computeMatrix scale-regions -S WT_log2ratio.bw RNAi_log2ratio.bw  -R ./Pbursaria_annotation.bed -bs 10 --outFileNameMatrix RNAi-WT_computeMatrix.txt --outFileSortedRegions RNAi-WT_SortedRegions.bed --missingDataAsZero -b 1000 -a 1000 -o RNAi-WT_computeMatrix.gz --regionBodyLength 1000 -p 6 --samplesLabel WT RNAi &

wait

plotHeatmap  -m RNAi-WT_computeMatrix.gz   --colorMap Blues   -out RNAi-WT_RPGC-readEXT_heatmap.pdf 
