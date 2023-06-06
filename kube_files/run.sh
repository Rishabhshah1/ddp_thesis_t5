### Note: all paths referenced here are relative to the Docker container.
#
# Add the Nvidia drivers to the path
export PATH="/usr/local/nvidia/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/nvidia/lib:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/tools/cuda/lib64
export TRANSFORMERS_CACHE="/scratch/scratch1/rishabh/t5chem/cache"
# Tools config for CUDA, Anaconda installed in the common /tools directory
source /tools/config.sh
# Activate your environment
source activate /scratch/scratch1/rishabh/envs/t5chem
# Change to the directory in which your code is present
cd /scratch/scratch1/rishabh/t5chem/t5chem
# Run the code. The -u option is used here to use unbuffered writes
# so that output is piped to the file as and when it is produced.
# Here, the code is a simple Pytorch script to check if we are using the GPU.
# ls /scratch/scratch4
# df -h
# python -u t5_implementation.py &> /scratch/scratch1/rishabh/T5/out
# t5chem train --data_dir data/USPTO_MIT/MIT_mixed/ --output_dir model_mit_complete_token1/ --task_type product --pretrain models/pretrain/simple/ --tokenizer welll --num_epoch 30 &> /scratch/scratch1/rishabh/t5chem/out_token1.log
# t5chem train --data_dir /scratch/scratch1/rishabh/t5chem/data/USPTO_MIT/MIT_mixed/ --output_dir /scratch/scratch1/rishabh/t5chem/model_mit_com_nopretrain/ --task_type product --num_epoch 30 &> /scratch/scratch1/rishabh/t5chem/out_simple_com_nopretrain.log
# python run_trainer.py --data_dir /scratch/scratch1/rishabh/t5chem/data/USPTO_MIT/MIT_mixed/ --output_dir /scratch/scratch1/rishabh/t5chem/model_mit_complete_pretoken_pretrain/ --task_type product --pretrain /scratch/scratch1/rishabh/t5chem/models/pretrain/simple/ --tokenizer ours &> /scratch/scratch1/rishabh/t5chem/out_pretoken_pretrain.log
# python run_trainer.py --data_dir /scratch/scratch1/rishabh/t5chem/data/USPTO_MIT/MIT_mixed/ --output_dir /scratch/scratch1/rishabh/t5chem/model_mit_com_nopretrain/ --task_type product --num_epoch 30 &> /scratch/scratch1/rishabh/t5chem/out_simple_com_nopretrain.log
python pred_top_n.py --data_dir /scratch/scratch1/rishabh/t5chem/data/USPTO_MIT/MIT_mixed/ --model_dir /scratch/scratch1/rishabh/t5chem/model_mit_complete_token --num_preds 10