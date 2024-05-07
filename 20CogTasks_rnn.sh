#!/bin/bash
#SBATCH --job-name=pdiff      
#SBATCH --partition=fiete
#SBATCH --gres=gpu:a100:1                  
#SBATCH --mem=48gb                    
#SBATCH --time=18:00:00               
#SBATCH --output=/om2/user/annhuang/jobs/job_%j.log        
#SBATCH --error=/om2/user/annhuang/jobs/job_%j.err        
#SBATCH --mail-type=BEGIN,END,FAIL    
#SBATCH --mail-user=annhuang42@gmail.com

module load openmind8/anaconda/3-2022.10

source activate pdiff

python task_training.py # get the model data for training p-diff

python train_p_diff.py task=cognitive system=ddpm
