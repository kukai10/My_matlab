f0 = @(x) sin(x);
f1 = @(x) cos(x);
f2 = @(x) -sin(x);
% c1 functions
c1f = @(x) -4 * (x^2);
c2f = @(x) 3*x;
c3f = @(x) 2;
a = -1;
b = 1;
h = 0.01;
x = a:h:b;
n = numel(x);
c = zeros(numel(x), 3);
f = zeros(numel(x), 1);
actualf = zeros(numel(x), 1);
for i=1:numel(x)
    f(i) = f0(x(i));
    c(i, :) = [c1f(x(i)) c2f(x(i)) c3f(x(i))];
    actualf(i, 1) = c(i, :) * [f2(x(i)); f1(x(i)); f0(x(i))];
end
[lf, A] = fd_matrix(a, b, c(:, 1), c(:, 2), c(:, 3), f);
c = lf - actualf;
error = norm(c(2:n-1))