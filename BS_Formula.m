function [V] = BS_Formula(id, K, t, S, sigma, q, r)
    d1 = log(S/K)+t*(r-q+(sigma^2)/2)
    d2 = d1-sigma*sqrt(t)