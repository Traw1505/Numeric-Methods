function [L,U,P] = luFactor(A)
%The funtion luFactor.m will take in the usar's coeffient matrix (A) and
%output them a Lower triangular matrix, an Upper triangular matrix, and a
%pivoting matrix. [LU Factorization].
%   Inputs:  A = A coefficient matrix of a sytem of equations.(Must be
%   Square)
%   Outputs: L = Lower triangular matrix is a matrix of the factors used to
%            elimate while performing LU factorization.(Factor used and kept track
%            of in gauss elimination)
%            U = An upper triangular matrix that is a matrix of the
%            factorization of matrix A during gauss elimination.
%            P = The pivot matrix starts out as an identity matrix and as
%            gauss elimination proceeds it changes and keeps track of the
%            row switches.

if nargin < 1  %If the input is less than one.   
    error('Must input a coefficient Matrix.')  %If the usar did not input a matrix "A" it will return an error message.
end  %Ending If statement.

if nargin > 1  %If the input is greater than one.
    error('Must only input one coefficient Matrix.')  %If the usar inputs more than one matrix it will return an error message.
end  %Ending If statement.

Dimsize = size(A);  %"Dimsize" is a matrix of the dimensions of matrix A (Size of Matrix A).

if size(A,1) ~= size(A,2)  %If the number of rows is not equal to the number of columns (square matrix). 
    error('Your matrix "A" must be a square matrix (Rows=Columns).')  %If rows do not equal columns it will retun an error message.
end  %Ending If statement.

%%Preliminary Points.
P = eye(Dimsize);  %Preliminary Identity matrix for the Pivot Matrix.
%Off the start, the Pivot matrix is just an identity matrix.

L = eye(Dimsize);  %Preliminary Identity matrix for the lower triangular matrix.
%Off the start, the Lower triangular matrix is just an identity matrix.

U = A;  %Preliminary Matrix for the upper triangular matrix.
%Off the start, the upper triangular matrix is just a copy of the usar
%inputed "A" matrix.

%%Pivoting Proccess.
for I = 1:Dimsize  %For loop evaluating from 1 to whatever the size of the A matrix the usar inputed.
    Piv = max(abs(U(I:Dimsize,I)));  %Finding the Pivot element (Max Absolute Value (If not at top already)).
    for M = I:Dimsize  %For loop evaluating from 1 to whatever the size of the A matrix the usar inputed.
        if (abs(U(M,I))==Piv)  %Determining what row to pivot.
            S = M;
        end
    end
    
    U([I,S],I:Dimsize) = U([S,I],I:Dimsize);  %Pivoting based on the values calculated above.
    %This section Refers to the pivoting of the Upper triangular matrix,
    %therefore the "U" matrix has now transformed from the "A" Matrix.
    
    L([I,S],1:I-1) = L([S,I],1:I-1);  %Pivoting based on the values calculated above.
    %This section Refers to the pivoting of the Lower triangular matrix,
    %therefore the "L" matrix has now transformed form the identity matrix.
    %It fills in the spots with the factors used for elimination.
    
    P([I,S],:) = P([S,I],:);  %Pivoting based on the values calculated above.
    %This section Refers to the pivoting of the Pivot matrix. The Pivot
    %matrix keeps track of the movement of rows. From this matrix you can
    %see what pivoting occured to the matrix over the proccess.
    
    %%Elimination Proccess.
    for M = I+1:Dimsize 
        
        L(M,I) = U(M,I)/U(I,I);  %Calculating the factor to to store inside of the Lower triangular Matrix.
        %From here the "L" matrix has now changed from an identity matrix
        %and now has spots that are filled with the factors used in the
        %elimination proccess.
        
        U(M,I:Dimsize) = U(M,I:Dimsize)-L(M,I)*U(I,I:Dimsize);  %Here, the function redefins the "U" Matrix.
        %After the elimination proccess, the "U" Matrix's row is replaced
        %with whatever is left after elimination.
    end
end

disp('Lower Triangular Matrix:');disp(L)  %Displaying the Lower triangular Matrix.
%Displays a string message along with the "L" Matrix.

disp('Upper Triangular Matrix:');disp(U)  %Displaying the Upper triangular Matrix.
%Displays a string message along with the "U" Matrix.

disp('Pivoting Matrix:');disp(P)  %Displaying the Pivot Matrix.
%Displays a string message along with the "P" Matrix.

end

