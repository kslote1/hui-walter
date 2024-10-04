# Online Estimation of Classifier Performance and Priors in Absence of Ground-Truth
This repository contains the experiments presented in the paper "Online Estimation of Classifier Performance and Priors in Absence of Ground-Truth" submitted to SigKDD.

## Introduction
The goal of this project is to evaluate the proposed method for online estimation of classifier performance and priors in the absence of ground-truth. In this context, we evaluate our method in three different scenarios:

* When the classifier is learning from a stationary dataset.
* When the classifier is learning from a non-stationary dataset.
* When the classifier is a pre-trained model, and new data is coming from a different distribution.

Requirements
- Python 3.6+
- NumPy
- Scikit-learn
- Pandas
- Setup

Clone the repository:

shell
Copy code
$ git clone https://github.com/kslote1/hui-walter.git
Install the dependencies:

```{bash}
$ pip install -r requirements.txt
```

## Guide to Notebooks and Scripts

### Core Work

1. [Latent Profile Analysis](latent_class_analysis.ipynb) introduces the Wisconsin Breast Cancer Dataset (WBCD) and runs Latent Profile Analysis to partition it into latent subpopulations.

2. [Hui-Walter Gibbs Sampler](Hui-Walter Gibbs Sampler.ipynb) uses the WBCD dataset with subpopulation information from the previous step.  It is partitioned into a training and test dataset.  Random Forest and SVM models are trained on the training dataset and generates predictions for the test dataset.  These test predictions are written to a file.

3. [hw_estimate](hw_estimate.R) is the R script that uses the file from the previous step to generate estimates of the base rate of Malicious diagnosis for the subpopulations as well as FPR and FNR for the Random Forest and SVM models

4. [online](online.ipynb) performs online Hui-Walter and resulting analysis.

5. [Reproduction](MLE.ipynb) of the original hui-walter paper.

### Supplemental

* [t-sne](t-sne.ipynb) contains the t-sne dimension reduction visualization of the latent populations estimated in [Latent Profile Analysis](latent_class_analysis.ipynb)
* [Distribution Plots](Fig. 5.) The R notebook for Figure 5. 
* [Bivariate Features Plots]() The jupyter notebook for Fig. 3.
