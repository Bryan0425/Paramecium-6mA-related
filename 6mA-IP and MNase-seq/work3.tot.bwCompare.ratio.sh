cat compare.info|while read input IP;do
echo "bigwigCompare -b1 $IP.frag.100-500.bigwig  -b2 $input.frag.100-500.bigwig --outFileFormat bigwig --operation ratio --skipZeroOverZero --pseudocount 1 1  --skipNAs --binSize 1 --numberOfProcessors 16 -o $IP.ratio.100-500.bw " > $IP.log2.sh
nohup sh  $IP.log2.sh >&  $IP.log2.sh.log &
done
