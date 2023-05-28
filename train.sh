#!/usr/bin/env bash

set -e

CONFIG=$1
INPUT=$2
OUTPUT=$3
python phasealign.py $INPUT $OUTPUT
python prep_wav.py "$CONFIG" -n 1 -rs 20 -s "Data/aligned/$(basename $INPUT)" "Data/aligned/$(basename $OUTPUT)" 
python dist_model_recnet.py -l "RNN3-$CONFIG" --validation_p 200 --pre_filt None -lm 0
output_fbname=$(basename "$OUTPUT" | cut -d. -f1)
mv "Results/$CONFIG/model_best.json" "Results/$CONFIG/$output_fbname_best.json"
