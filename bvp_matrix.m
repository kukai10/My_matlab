function [A, L, U, P] = bvp_matrix(a, b, c1, c2, c3, a1, b1, a2, b2)
    n = numel(f) - 1;
    [A1, A2, A3, h] = deal(zeros(n+1, n+1), zeros(n+1, n+1), zeros(n+1, n+1), (b-a)/n);
    for i=2:n
        i
        [A1(i-1, i), A1(i, i), A1(i+1, i)]  = deal( c1(i-1) / h^2 , -2*c1(i-i) / h^2 , c1(i-1) / h^2);
        [A2(i-1, i), A2(i+1, i)] = deal(-c2(i-1) / (2*h), -c2(i+1) / (2*h));
        A3(i, i) = c3(i-1);
    A = A1+A2+A3;
    [L, U, P] = lu(A)