#!/bin/bash

echo "Preprocessing..."
DATA_PATH=data/RealSnow10k

mkdir -p $DATA_PATH/Snow 
mv $DATA_PATH/*.jpg $DATA_PATH/Snow 
cp -r $DATA_PATH/Snow $DATA_PATH/Gt

echo "Processing..."

python knoledge_distillation.py \
    --flag K1 \
    --base_channel 18 \
    --num_block 6 \
    --eval_in_path_L "/home/lorenzomignone/gitlab/vista/models/WGWS-Net/$DATA_PATH/Snow" \
    --eval_gt_path_L "/home/lorenzomignone/gitlab/vista/models/WGWS-Net/$DATA_PATH/Gt" 

echo "Postprocessing..."
rm -rf $DATA_PATH/Gt
cp -r resultsSetting3-K1-RealSnow $DATA_PATH/Gt 
rm -rf resultsSetting3-K1-RealSnow

echo "Done!"