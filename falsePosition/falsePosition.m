function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition: This function will estimate the root of a given function
%given a lower and upper x value, a desired error value, and the number of
%iterations desired to run.
%   Inputs: func-The function being evaluated, xl-Lower guess, xu-Upper
%   guess, es-Desired relative error, maxiter-The number of iterations
%   desired.
%   Outputs: root-Estimated root location, fx-Function evaluated at the
%   root location, ea-Relative error, iter-Number of iterations preformed.
if nargin < 3   %If there are less than 3 inputs = Error.
    error('Must Have at Least Three Inputs');
end
if nargin < 4   %If there are less than 4 inputs = es, maxiter = default.
    es = .000001;
    maxiter = 200;
end
if nargin < 5   %If there are less than 5 inputs maxiter = default.
    maxiter = 200;
end
if nargin > 5   %If there are more than 5 inputs = Error.
    error('Must Have Five or Less Inputs');
end

if func(xl) > 0 && func(xu) > 0 %If both f(xl) && f(xu) are positive then the root was not bracketed.
    error('You Have Not Bracketed the Root');
end
if func(xl) < 0 && func(xu) < 0 %If both f(xl) && f(xu) are negative then the root was not bracketed.
    error('You Have Not Bracketed the Root');
end
if func(xl) == 0 %If f(xl)= 0 then the usar has guessed the root.
    disp('You Have Guessed the Root of the Function');
end
if func(xu) == 0 %If f(xu)= 0 then the usar has guessed the root.
    disp('You Have Guessed the Root of the Function');
end

ea =1;  %Starting at 100 Percent error.
cnt = 1;    %Starting the count at 1.
while (es < ea) && (cnt < maxiter)  %While loop making sure initial conditions are met.
    xl = xl;    %Defining.
    xu = xu;    %Defining.
    root = xu-(((func(xu))*(xl-xu))/((func(xl))-(func(xu))));   %False Position Equation.
    vectorRoot(cnt+1) = root;   %Storing roots in a vector.
    ea = abs(((vectorRoot(cnt+1))-vectorRoot(cnt))/(vectorRoot(cnt+1)))*100;    %Calculating the error Percentage.
    fx = func(root);    %Function evaluated at the root.
    if func(xl)*fx < 0  %Setting new Brackets.
        xu = root;
    elseif func(xu)*fx <0   %Setting new Brackets.
        xl = root;
    end
    cnt = cnt+1;    %Adding 1 to the count.
end
iter = cnt-1;   %Subtracting 1 from the initial count becasue we started at 1.
disp('The roots Location Is:');disp(double(root))
disp('The Function at the Root Is:');disp(double(fx))
disp('The Approximate Relative Error Is:');disp(double(ea))
disp('The Number of Iterations Is:');disp(double(iter));
%Displaying all Outputs nicely with a string and a double.
end

