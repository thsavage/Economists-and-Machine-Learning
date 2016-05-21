library(neuralnet)

# XOR neural net
# Show what XOR looks like
XOR <- c(0,1,1,0)
xor.data <- data.frame(expand.grid(c(0,1), c(0,1)), XOR)
xor.data

set.seed(3282016)

# Fit a model with one hidden layer and backpropagation.  10 random starts.
# This is essentially the logit.
print(net.xor <- neuralnet(XOR~Var1+Var2, xor.data, 
                           threshold=0.01, lifesign="full", hidden=1, rep=10, algorithm="backprop", learningrate=2,
                           err.fct="sse", act.fct="logistic", linear.output=FALSE))

# Look at predictions and graph the best network.
prediction(net.xor)
plot(net.xor, rep="best")

set.seed(3282016)

# Now increase to five hidden layers.
print(net.xor <- neuralnet(XOR~Var1+Var2, xor.data, 
                           threshold=0.01, lifesign="full", hidden=5, rep=10, algorithm="backprop", learningrate=2,
                           err.fct="sse", act.fct="logistic", linear.output=FALSE))

prediction(net.xor)
plot(net.xor, rep="best")