#!/usr/bin/env bash

set -e

CONFIG=$1
INPUT=$2
OUTPUT=$3

python phasealign.py $INPUT $OUTPUT
python prep_wav.py "$CONFIG" -n 1 -rs 20 -s "Data/aligned/$(basename $INPUT)" "Data/aligned/$(basename $OUTPUT)" 

python dist_model_recnet.py -l "RNN3-$CONFIG"  --pre_filt None -lm 0

output_fbname=$(basename "$OUTPUT" | cut -d. -f1)
config_file="RNN3-$CONFIG.json"
device_name=$(cat "Configs/$config_file" | jq -r ".device")
results_dir="Results/$device_name-$CONFIG"
mv "$results_dir/model_best.json" "$results_dir/$output_fbname_best.json"

echo -e '\a'
