function [v] = bs_eu_be(N, M, K, T, r, q, sigma, Sm)
    % simple initailization
    [h, k, a1, b1, a2, b2] = deal(Sm/N, T/M, 1, 0, 1, 0);
    % make a vector that that are incremented by a small interval
    [s, t] = deal([0:h:Sm]', [0:k:T]');
    % create c1 and c2 requird for bvp_matrix and figure out the value of the put
    [c1, c2, v] = deal(-k*(sigma^2)*s.*(s/2), -k*(r-q)*s, max(K-s,0));
    [n, c3] = deal(length(c2), zeros(length(c2),1));
    % fill c3 vector
    for i=1:n
        c3(i) = k*r + 1;
    end
    % get the L, U, and P from the decompsition, ~ is there for A because we dont need A for this program
    [~, L, U, P] = bvp_matrix(0, Sm, c1, c2, c3, a1, b1, a2, b2);
    % solve for v iteratively
    for i=1:M
        [g1, g2] = deal(exp(-r*t(i))*K , 0);
        v = bvp_solve(v, g1, g2, L, U, P);
    end