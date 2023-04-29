function test_JacobiRotation()
tol = 1e-4;
for N = 3:100
    for i = 1:N
        for j = 1:N
            if(i == j)
            else
                d = 1000000*rand(N,1); % The diagonal values
                t = triu(bsxfun(@min,d,d.').*rand(N),1); % The upper trianglar random values
                A = diag(d)+t+t.'; % Put them together in a symmetric matrix
                Q = JacobiRotation(A,i,j);
                B = Q'*A*Q;
                if(Q - eye(N) < tol)
                    break
                end
                if(abs(B(i,j))>tol && abs(B(j,i))>tol)
                    disp(full(A))
                    disp(i)
                    disp(j)
                    disp(Q)
                    disp(B)
                    disp(B(i,j))
                    disp(B(j,i))
                    error('No')
                else
                    fprintf('Yes\n')
                end
            end
        end
    end
end
end
            