function EigenValue = JacobiEigen(A)
% Define eigenvector matrix
EigenVector = eye(size(A));
[largest,row_index,col_index] = findLargestElement(A);
format long;
for i =1:10000
    A = findingD(A);
    disp(largest)
    EigenVector = JacobiRotation(A,row_index,col_index)*EigenVector;
end
EigenVector = EigenVector';
EigenValue = diag(A);
% for accurate results following code can be used
% while ~isDiagonal(A)
%     A = findingD(A);
%     EV = Bmatrix(A)*EV;
% end
%display the results
format shortg;
disp("eigen vales of A are")
disp(EigenValue)
disp("eigen vector matrix of A is")
disp(EigenVector)
end
