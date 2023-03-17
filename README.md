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

