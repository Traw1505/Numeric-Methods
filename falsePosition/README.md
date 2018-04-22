# falsePosition.m
## About falsePosition.m
The falsePosition.m algorithm uses the false position root finding method to find the root "Solution" of a usar inputed function, lower guess, upper guess, desired error, and max interations. The function required the usar to input at minimum the function, lower, and upper guess, but does not require the usar to input the desired error or maximum number of iterations. The algorithm then performs false position given the usar's perameters and outputs the usar with an estimated root for their function.
## Inputs
* func - symbolic function whose root is desired
* xl - Lower Guess of the Root
* xu - Upper Guess of the Root
* es - Desired error (Optional: if left out will default to 0.0001)
* maxiter - Maximum Number of iterations desired (Optional: if left out will default to 200)
## Outputs
* root - location of the root
* fx - function value at the root (should be essentially 0)
* ea - approximate percent error
* iter - number of iterations run.
## More information about falsePosition.m
The falsPosition.m algorithm has some downfall to it in that if the usar inputs some obscure lower or upper guess it will have a scewed estimated root. Also, the algorithm will output errors if the lower and upper guess are not surrounding the root, or if the usar has guess the root with either the lower or upper guess.
