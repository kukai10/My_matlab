function [sigma] = volatility_european_formula(id, V, K, t, S, q, r, s0, s1, tol, maxn)
sigma = secant_method(s0, s1, @(sn) V-BS_formula(id, K, t, S, sn, q, r), tol, maxn);
    