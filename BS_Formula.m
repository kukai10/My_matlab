function [V] = BS_Formula(id, K, t, S, sigma, q, r)
    % due to put-call parity, BS formula's Call and Put looks symetric, opposite coefficients are handled by the id
    d1 = (log(S/K)+t*(r-q+(sigma^2)/2))/(sigma*sqrt(t));
    [d2, id_array] = deal(d1-sigma*sqrt(t), [1, -1]);
    y  = cdf("normal", [-d1, -d2, d1, d2], 0, 1); % probabilities of option being and not being excersized
    V = id_array(id+1)*(K*exp(-r*t)*y(id*2+2)-S*exp(-q*t)*y(id*2+1)); 