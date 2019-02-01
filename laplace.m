
%%
% Feynman - Kac Monte Carlo for certain PDEs 
%%
% We solve the PDE
% $\Delta u = 0$, 
% $u = 1$  on  $B_1$,  
% $u = 0$  on  $B_2$
% on the domain $[0, 1]^2$, where $B_1$ is the union of top and bottom edges
% and $B_2$ is that of the left and right edges of the boundary.
% The graph of the solution represents the minimal surface subtended by the
% boundary condition curve (the soap bubble problem).
% The Method of solution is a Monte Carlo technique based on the Feynman -
% Kac Theorem: the value of the solution $u$ at $x$ is the expectation of
% the value of the boundary condition function of the random walk when the
% random walk hits the boundary.
% In this case, the boundary condition function is 
% $g(x) = 1$ for $x \in B_1$,  
% $g(x) = 0$  for $x \in B_2$.
% and thus $u(x) =$ the probability that the random walk hits $B_1$ before $B_2$.
% The method is slower than the other numerical approaches. It is presented
% as an experiment and for illustrative purposes.

clear; 
n = 15; % grid fineness
N = 12000; % number of random walks generated from each point on the grid;
% the greater n and N are, the greater is the accuracy of u and the longer
% is the execution time.
u = zeros(n+1, n+1); % solution initialized with zero
[x,y] = meshgrid(0:n);
x = x/n; y = y/n;
tic; % begin timing
for i = 0:n
    for j = 0:n
        nb = 0; % counts the number of paths from the point x = (i,j)
        hits = zeros(1,N); % boundary hiting results initialized with zero
        while(nb < N)
            a = i;
            b = j;
            
            % 2D random walk on the grid as an approximation to 
            % Brownian motion starting at (i, j)
            while((a < n)&&(a > 0)&&(b < n)&&(b > 0)) % exits when the
                % random walk hits the boundary
                switch(floor(4*rand))
                    case 0
                        a = a + 1;
                    case 1
                        a = a - 1;
                    case 2
                        b = b + 1;
                    case 3
                        b = b - 1;
                end
            end
            
            a = a/n; b = b/n; nb = nb + 1;
            if (a == 0) || (a == 1)
                hits(nb) = 1;
            end
        end
        
        u(i+1,j+1) = mean(hits);
    end
end
toc; % end of timing
surf(x,y,u, 'FaceColor', 'y')
camlight('left')
alpha 0.8
axis equal


