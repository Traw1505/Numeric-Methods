function [I] = Simpson(x,y)
%The function "Simpson.m" will take certain Input and Output matrix and
%then calculate the integral of the data given. This function will make
%sure that all the inputs are equally spaced as well. Lastly, the function
%will use the Simpson's 1/3 rule to calculate the integral unless there is
%an odd number of intervals. In the case that there is an odd number of
%intervals the function will combine the Simpson's 1/3 rule and use the
%trapezoidal rule on the last interval. The function will also warn the
%usar if it has to use the trapezoidal rule.
%Inputs & Outputs:
%   Inputs:
%           x = Inputed Vector.
%           y = Inputed Vector.
%
%   Outputs:    I = The calculated Integral of the given data. 


%Error Statements.
if nargin ~= 2  %There must be 2 Inpute args.
    error('There Must be two Imputs to run this Function (x & y)')  %If there are not exactly 2 inputs this error displays.
end

xlth = length(x);   %Setting Var. for the length of "x".
ylth = length(y);   %Setting Var. for the length of "y".

if xlth ~= ylth     %If xlth and ylth are not equal.
    error('The size of the Input Matrixes Must be the Same')    %Spits out error if they are not equal.
end

changex = diff(x);   %Setting Var. for the change in "x".
if max(changex) ~= min(changex) %If the change in "x" is not constant then spits out error.
    error('The input "x" must be equally spaced') %If the change in "x" is not constant then spits out error.
end

evodd = mod(xlth,2); %Evaluates if there are even or odd amount of intervals.
oddy = y(3:2:end-2);    %Odd placements of y.
evey = y(2:2:end-1);    %Even placements of y.
h = (x(end)-x(1))/(xlth-1); %Step size between intervals.

if evodd == 1   %If there are an even number of intervals.
    I = (h./3).*(y(1)+(4.*(sum(oddy)))+(2.*(sum(evey)))+y(end)); %Simpsons 1/3 rule.
    disp('The Integral of the Given Data is:');disp(I)  %Displaying Ans.
elseif evodd == 0   %If there are an odd number of intervals.
    I = ((h./3).*(y(1)+(4.*(sum(oddy)))+(2.*(sum(evey)))+y(end-1)))+((x(end)-x(end-1)).*((y(end-1)+y(end))/(2)));   %1/3 rule + Trapezoidal.
    disp('The Integral of the Given Data is:');disp(I) %Displaying Ans.
    disp('WARNING: The number of intervals is odd and Trapezoidal Rule was Used!')  %Displaying warning for using trapezoidal.
end   
end

