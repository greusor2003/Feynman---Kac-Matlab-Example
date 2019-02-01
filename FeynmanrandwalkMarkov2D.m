
%%
%%
% *Markov chain based solution for Laplace equation* 
% 
% Let $B = [0, 1]^2$, $B_1 = [0, 1] \times \{0, 1\}$, $B_2 = \{0, 1\} \times [0, 1]$.
% We solve the PDE $\Delta u(x) = 0$, $u(x) = 1$ for $x \in B_1$, $u(x) = 0$ for $x
% \in B_2$. 
% The solution is obtained as the limit state of a Markov chain whose
% transition matrix corresponds to a random walk with absorbing states so
% that the boundary condition is verified.
n = 15; % grid fineness
psi = [ones(1,n) zeros(1,n^2-2*n) ones(1,n)]'; % initial state 
M = Markovrandwalk2absorb(n); % transition matrix
N = 12000; % number of iterations
[X,Y] = meshgrid(0:n-1);
X = X/(n-1); Y = Y/(n-1);
tic;
u = M^N*psi; % solution as one row vector
m = rot90(reshape(u,n,n)); % solution on the grid
toc;

surf(X,Y,m, 'FaceColor', 'y')
alpha 0.8
axis equal
light
camlight('left')

    
