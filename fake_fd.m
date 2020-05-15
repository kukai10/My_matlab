function [Lf, A] = fd_matrix(a, b, c1, c2, c3, f)
    % initailization
    n = numel(f);
    h = (b-a)/(n-1);
    A1 = zeros(n, n);
    A2 = zeros(n, n);
    A3 = zeros(n, n);


    for i = 2:(n-1) % make A1
        A1(i, i-1) = c1(i)/(h^2);
        A1(i, i) = -2*c1(i)/(h^2);
        A1(i, i+1) = c1(i)/(h^2);
    for i = 2:(n-1) % make A2
        A2(i, i-1) = -c2(i) / (2*h);
        A2(i, i+1) = c2(i) / (2*h); 
    for i = 2:(n-1) % make A3     
        A3(i, i) =  c3(i); 
    end 
    
    A = A1+A2+A3
    Lf = mtimes(A, f);