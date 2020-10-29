function [y] = myFoo(x, h)

y = 2 * h^2 * exp(x + h) * cos(x + h) - sin(x) * exp(x);