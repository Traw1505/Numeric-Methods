# Simpson.m
## About Simpson.m
Simpson.m is a MATLAB function that uses Simspon's 1/3 rule to calculate the integral of tabular data.
## Inputs
* x - Matrix of the independent variable data
* y - Matrix of the dependent variable data
## Outputs
* I - Integral value of the input data
## Other Information about Simpson.m
The inputs for Simpson.m are required to be the same size matrix. The x input must have even spacing between each value for this function to work properly. The alogrithm will automaticall detect whether there is an even amount of intervals or an odd amount of intervals. If there is an odd amount of intervals, Simpson.m will perform Simpson's 1/3 rule on all but the last interval and then it will perform trapezoidal rule on the last interval. The algorithm will also tell you when the trapezoidal rule was used. 
