A = readtable('Datafile.csv');
N = size(A,1);
A = A{:,:};
for idx = 1:N
  r = A(idx, :);
  r = r - mean(r);
  A(idx, :) = r;
end
C = A*A'/N;
[V,E] = eig(C); %V is the eigenvector matrix and D is the matrix with the diagonal of eigenvalues
[Es, idx] = sort(diag(E), 1, 'descend');
disp(Es) %sorted eigenvalues
disp(idx) %position of the sorted eigenvalues 1, 2, 3, ..., 17
% Rearrange eigenvectors to
% match eigenvalues.
for cnt = 1:length(Es)
  Vs(:,cnt) = V(:,idx(cnt));
end
% Now plot eigenaxes
B = zeros(3, size(A,2)); 
VsT = Vs'; %17 by 17
P = VsT(1:3,:); % 3 by 17, the three eigenvectors corresponding to the three largest eigenvalues
for col = 1:size(A,2)
    B(:,col) = P*A(:,col); % 3*17 17*1700 = 3*1700
end
figure(1)
scatter3(B(1,:),B(2,:),B(3,:))
title('PCA by using eigenvalue decomposition','FontSize',16)
hold on

% Now plot eigenaxes
e1 = 30*horzcat(zeros(17,1), Vs(:,1))';
plot3(e1(:,1), e1(:,2), e1(:,3), 'r')
e2 = 30*horzcat(zeros(17,1), Vs(:,2))';
plot3(e2(:,1), e2(:,2), e2(:,3), 'b')
e3 = 30*horzcat(zeros(17,1), Vs(:,3))';
plot3(e3(:,1), e3(:,2), e3(:,3), 'g')
saveas(gcf,'Eigen.jpg')


% S = svd(A);
[U,S,V] = svd(A);
for i = 4:size(S,1)
    S(i,i) = 0;
end

UT = U';
K = zeros(3, size(A,2)); 
P = UT(1:3,:); % 3 by 17, the three eigenvectors corresponding to the three largest eigenvalues
for col = 1:size(A,2)
    K(:,col) = P*A(:,col); % 3*17 17*1700 = 3*1700
end

figure(2)
scatter3(K(1,:),K(2,:),K(3,:))
title('PCA by using sigular value decomposition','FontSize',16)
hold on
% Now plot eigenaxes
e1 = 30*horzcat(zeros(17,1), U(:,1))';
plot3(e1(:,1), e1(:,2), e1(:,3), 'r')
e2 = 30*horzcat(zeros(17,1), U(:,2))';
plot3(e2(:,1), e2(:,2), e2(:,3), 'b')
e3 = 30*horzcat(zeros(17,1), U(:,3))';
plot3(e3(:,1), e3(:,2), e3(:,3), 'g')
saveas(gcf,'SVD.jpg')

