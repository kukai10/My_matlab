function [A, L, U, P] = bvp_matrix(a, b, c1, c2, c3, a1, b1, a2, b2)
    n = numel(c1); % n includes the o base index position
    [h, A1, A2, A3] = deal((b-a)/(n-1), zeros(n,n), zeros(n, n), zeros(n, n));
    for i = 2:(n-1) % loop and fill matrices
        [A1(i, i-1), A1(i, i), A1(i, i+1)]  = deal(c1(i)/(h^2) ,-2*c1(i)/(h^2),c1(i)/(h^2));
        [A2(i, i-1), A2(i, i+1), A3(i, i)] = deal(-c2(i) / (2*h), c2(i) / (2*h), c3(i)); 
    end % find Lf and A
    A = A1+A2+A3;
    [A(1, 1), A(1, 2), A(1, 3)] = deal(a1 - (3*b1/(2*h)), 2*b1/h, -b1/(2*h));
    [A(n, n-2), A(n, n-1), A(n, n)] = deal(b2/(2*h),-2*b2/h, a2+3*b2/(2*h));
    [L, U, P] = lu(A);