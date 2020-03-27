% Newton's method for solving a nonlinear equation.
% f(x) = 0

% Inputs 
% --------
% x0 - initial guess
% f - function handle created as f = @(x) x^3+x+1
% fp - function handle of the derivative of f(x)
% tol - tolerance
% maxn - maximum number of iterations

% Outputs
% --------
% y - solution to f(x) = 0
% niter - total number of iterations performed
% yv - column matrix of all the output y for each iteration
% error - numerical error

% Note
% -----
% Absolute error is used


function [y error niter yv] = newton(x0, f, fp, tol, maxn)

yv = [];
yv(1) = x0;
for i = 1:maxn         % at most maxn iterations 
    r = f(x0)/fp(x0);  % r will also be equal to x(i+1)-x(i)
    y = x0 - r;        % x(i+1) is computed
    yv(i+1) = y;
    x0 = y;            % x(i) is updated for next iteration
    if abs(r) < tol    % judge if tolerance is reached
        break
    end
end

error = abs(r);
niter = i;
yv = yv';
