function [u] = bvp_solve(r, g1, g2, L, U, P)
    [r(1), r(numel(r))] = deal(g1, g2); % put g1 and g2 at the begining and end of the vector
    u = U\(L\(P*r)); # solve LU*x= P*r 