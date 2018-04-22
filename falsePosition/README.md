# falsePosition.m
## About falsePosition.m
The falsePosition.m algorithm uses the false position root finding method to find the root "Solution" of a usar inputed function, lower guess, upper guess, desired error, and max interations. The function required the usar to input at minimum the function, lower, and upper guess, but does not require the usar to input the desired error or maximum number of iterations. The algorithm then performs false position given the usar's perameters and outputs the usar with an estimated root for their function.
## Inputs
* Function
* Lower guess of the root
* Upper guess of the root
* The desired error between true and calculated roots (Optional)
* The maximum number of interations (Optional)
## Outputs
* The estimated root of the function that the usar inputed.
## More information about falsePosition.m
The falsPosition.m algorithm has some downfall to it in that if the usar inputs some obscure lower or upper guess it will have a scewed estimated root. Also, the algorithm will output errors if the lower and upper guess are not surrounding the root, or if the usar has guess the root with either the lower or upper guess.
