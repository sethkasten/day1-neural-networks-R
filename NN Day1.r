# based on tutorial from https://www.datacamp.com/community/tutorials/neural-network-models-r
# adjusted to remove deprecated functions and cleaned code

# install package
install.packages("neuralnet")

# creating training data set
TKS=c(20,10,30,20,80,30)
CSS=c(90,20,40,50,50,80)
Placed=c(1,0,0,0,1,1)

# create dataframe by combining each column
df=data.frame(TKS,CSS,Placed)

# load library
require(neuralnet)

# fit neural network
nn=neuralnet(Placed~TKS+CSS,data=df, hidden=3,act.fct = "logistic", linear.output = FALSE)

# plot neural network
plot(nn)

# creating test set
TKS=c(30,40,85)
CSS=c(85,50,40)
test=data.frame(TKS,CSS)

## Prediction using neural network
Predict=predict(nn,test)
Predict

# results:
# [1,] 0.4006368
# [2,] 0.4006368
# [3,] 0.9004957

# Converting probabilities into binary classes setting threshold level 0.5
pred <- ifelse(Predict>0.5, 1, 0)
pred

# results:
# [1,]    0
# [2,]    0
# [3,]    1