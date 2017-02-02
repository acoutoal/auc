################################################################################
#Computing the standard error of the area under a ROC curve
#The SE of the area is calculated using this equation from
#Hanley JA, McNeil BJ. Radiology 1982 143 29-36. The meaning and use of the area under the Receiver Operating Characteristic (ROC) curve
#             ____________________________________________
#            /
#SE = __    /  A (1-A) + (na-1)(Q1 - A*A)+(nn-1)(Q2 - A*A)
#       \  /   -----------------------------------------
#        \/                     na*nn
#
#Where A is the area under the curve,
#na and nn are the number of abnormals and normals respectively, and
#Q1 and Q2 are estimated by:
#Q1 = A / (2 - A)
#Q2 = 2A*A / (1 + A)

aucse<-function(x,y)
{
#calculate AUC
W=na.omit(cbind(x,y));
x=W[,1]
y=W[,2]
x1 = x[y==1]; n1 = length(x1)+1E-19; na=n1;
x2 = x[y==0]; n2 = length(x2)+1E-19; nn=n2;
r = rank(c(x1,x2))
A = (sum(r[1:n1]) - n1*(n1+1)/2) / (n1*n2)

#Calculate SE of AUC
Q1 = A / (2 - A);
Q2 = 2*A*A / (1 + A);
numer= A*(1-A) + (na-1)*(Q1 - A*A) + (nn-1)*(Q2 - A*A);
denom= na*nn;
se= sqrt(numer/denom);
hi=A+se*1.96       #95% c.i.
lo=A-se*1.96       #95% c.i.

return(data.frame(auc=A, SE=se, lo=lo,hi=hi));

}#END OF FUNCTION

