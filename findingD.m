function [D] = findingD(A)
[largest , row_ind , col_ind] = findLargestElement(A);
B = JacobiRotation(A, row_ind, col_ind);
D = B'*A*B;
disp(largest)
end