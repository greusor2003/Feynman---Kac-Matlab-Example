function M = Markovrandwalk2(n)
% e.g. n=3, # of states = n^2 = 9: [ 1 2 3 4 5 6 7 8 9];
% ordered in the 2D random walk matrix [7 8 9; 4 5 6; 1 2 3]
% between the states of rows and columns of this matrix we have the
% transition probability 1/4. M is the Markov chain transitin probability
% matrix of the nine states as described by the random walk in the 2D
% random walk matrix.
M = zeros(n^2);
D1 = ones(n); D1(n,:) = zeros(1,n); d1 = D1(:); d1(length(d1)) = [];
dn = ones(1,n^2-n);
M = M + diag(d1,1) + diag(d1,-1) + diag(dn,n)+ diag(dn,-n); 
M=0.25*M;
end

