# auc
Estimates the area under the receiver operating characteristic (ROC) curve, closed form estimates of the standard error and 95% confidence interval

# Input
x -- Vector or continuous variables. Each variable holds the score of each observation

y -- Vector of binary variables with domain 1 or 0. Each variable holds the class of each observation

# Output
A data.frame with the following columns:

auc -- The area under the curve

SE  -- The standard error of the area under the curve

lo  -- The lower bound of the 95% confidence interval

hi  -- The upper bound of the 95% confidence interval


