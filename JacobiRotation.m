function Q = JacobiRotation(A,i,j)
tol = 1e-4;
if (abs(A-A')>tol)
    error('Matrix must be symmetric!');
end

beta = (A(i,i)-A(j,j))/(2*A(j,i));
t = sign(beta)/(abs(beta)+sqrt(beta.^2+1));
c = 1/sqrt(t.^2+1);
s = c*t;
% fprintf('c = %f\n',c)
% fprintf('s = %f\n',s)
q = eye(size(A));
q(j,j) = c;
q(j,i) = s;
q(i,j) = -s;
q(i,i) = c;
Q = q;
return
end