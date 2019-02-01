function M = Markovrandwalk2absorb( n )
% Markov 2D random walk on a n by n grid with absorbing boundary states 
M = Markovrandwalk2(n);
M(1:n,:) = [eye(n) zeros(n,n^2-n)];
M(n^2-n+1:n^2,:) = [zeros(n,n^2-n), eye(n)];
I = eye(size(M));
for k = 1:n-2
    M(1+k*n,:) = I(1+k*n,:);
    M(n+k*n,:) = I(n+k*n,:);
end