<div id="top"></div>

<!-- PROJECT LOGO -->
<br />
<div align="center">

<h2 align="center">Chemical Reaction Outcome Prediction</h2>

  <p align="center">
    Natural Language based Approach (Seq-to-Seq)
    <br />
    <a href="#about-the-project"><strong>Explore the docs »</strong></a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#setting-up-the-conda-environment">Setting up the conda environment</a></li>
      </ul>
    </li>
    <li>
      <a href="#usage">Usage</a>
      <ul>
        <li><a href="#preparing-the-dataset-for-training">Preparing the dataset</a></li>
        <li><a href="#training-the-model">Training the classification model</a></li>
      </ul>
    </li>
    <li><a href="#project-organization">Project Organization</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

## About The Project

This is a DL based approach for predicting chemical reaction outcome as part of my IITM MTech thesis. The problem is posed as sequence to sequence problem, where the input sequence is the string representation of the
LHS and the target sequence is the string representation of RHS. The T5 model, which is a Transformer based encoder-decoder type model, is used for the task. The implementation is derived from the official implementation of the paper title - ["Unified Deep Learning Model for Multitask Reaction Predictions with Explanation" by [Lu and Zhang (2022)]](https://github.com/HelloJocelynLu/t5chem).

<p align="right">(<a href="#top">back to top</a>)</p>

### Built With

- [Pytorch](https://pytorch.org//)
- [RDKit-Python](https://www.rdkit.org/docs/GettingStartedInPython.html)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- GETTING STARTED -->

## Getting Started
The instructions that follow are confirmed to be working on an Ubuntu system. 

### Setting up the conda environment

1. Create a new Anaconda environment using requirements file
   ```sh
   conda create --name <env> --file <requirements file>
   ```
2. Activate the conda environment
   ```sh
   conda activate envname
   ```

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- USAGE EXAMPLES -->

## Usage

### Preparing the dataset for training

1. MIT-USPTO dataset available online is used in the analysis. The dataset is available in the data/ folder of this repo. 

### Training the model:

1. Place the data in data/ folder 

2.  From the root directory, run the following to fine-tune the pretrained model. Remove the --pretrain arguement to train the model from scratch.
    ```sh
    python run_trainer.py --data_dir <data_dir> --output_dir <output_dir> --pretrain <model_path> --tokenizer <vocab_path>
    ```
    
<p align="right">(<a href="#top">back to top</a>)</p>

<!-- FOLDER STRUCTURE -->

## Project Organization
------------

    ├── LICENSE
    ├── README.md               <- The top-level README for developers using this project.
    ├── .gitignore              <- Git-ignore file. 
    |
    ├── kube_files              <- Contains files for running Kubernetes jobs
    │   ├── job.yaml            <- YAML file for creating and running a job
    │   ├── run.sh              <- The shell file that gets run in the job
    |
    ├── data
    │   ├── USPTO_MIT_mixed            <- MIT USPTO (mixed) dataset with 480k reactions
    │   ├── USPTO_MIT_seperated        <- MIT USPTO (seperated) dataset with 480k reactions
    |
    ├── requirements.txt          <- The requirements file
    │
    ├── models                    <- Pretrained model
    |
    ├── scripts                      
    |   ├── vocab
    |   |      ├── atom           <- Atom level (Apply WordPiece tokenization algorithm to SMILES strings using RegEx)
    |   |      ├── simple         <- Character level tokenizer
    |   |      ├── selfies        <- Self-Referencing Embedded Strings
    |   |      ├── ours           <- Pre-trained BPE tokenizer
    |   |      ├── combined       <- Simple + ours vocab
    |   |
    │   ├── data_utils.py         <- Python file containing helper functions
    |   ├── model.py              <- Python file containing model definitions
    |   ├── mol_tokenizers.py     <- Python file containing tokenizer definitions
    |   ├── pred_top_n.py         <- Python file for generating top n predictions and accuracies
    |   ├── run_trainer.py        <- Python file for training 
    |   ├── trainer.py            <- Python file containing helper functions for training
    |
    ├── out.py                    <- Python file for testing with custom input
--------

<p align="right">(<a href="#top">back to top</a>)</p>

<p><small>Project based on the <a target="_blank" href="https://drivendata.github.io/cookiecutter-data-science/">cookiecutter data science project template</a>. #cookiecutterdatascience</small></p>