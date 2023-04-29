function test_JacobiEigen()
for N = 3:100
    d = 1000000*rand(N,1); % The diagonal values
    t = triu(bsxfun(@min,d,d.').*rand(N),1); % The upper trianglar random values
    A = diag(d)+t+t.'; % Put them together in a symmetric matrix
    EigenValue_Jacobi = sort(JacobiEigen(A));
    EigenValue_Matlab = sort(eig(A));
    diff = abs(EigenValue_Jacobi - EigenValue_Matlab);
    disp([EigenValue_Jacobi EigenValue_Matlab])
    if(diff < 1e-4)
        disp('Yes')
    else
        disp(Ix*Jy)
        disp(eig(A))
        disp([EigenValue_Jacobi EigenValue_Matlab])
        error('No')
    end
end
end

