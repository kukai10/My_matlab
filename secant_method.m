function [xn] = secant_method(xnm1, xn, f, tol, maxn)
if nargin < 5 %default parameter values
    [xnm1, xn, tol, f, maxn] = deal(0, 1, 10^-10, @(x) x^3+x-1, 100);
end;
i = 1; % initialized counter
while (i<maxn+1) && (abs(xnm1-xn) > tol) % loop just assign values iteratively 
    [xnm1, xn, i] = deal(xn, vpa((xn-(xn-xnm1)*f(xn)/(f(xn)-f(xnm1)))), i+1);
end; % exit condition is counter and tolerance vs their respective threshold value
if abs(xnm1-xn) > tol
    printf("the function failed to converge.max iteration reached before convergence is below tolerance level");
end;