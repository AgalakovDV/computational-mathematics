function [] = Part1()

format compact;
p = 16;
h = 1e-16;

% y = x*ln(x)
% y' = ln(x) + 1
% y'' = 1/x
x = 1.4;
a = 1;
b = 3;

derivative1 = log(x) + 1;
derivative2 = 1/x;

steps = zeros(1, p);
error  = zeros(4, p);

% y = cos(2x)
% y' = -2*sin(2x)
% y'' = -4 * cos(2x)
x_s = 1.4;
a_s = 0;
b_s = pi;

derivative1_s = -2*sin(2*x_s);
derivative2_s = -4*cos(2*x_s);

error2  = zeros(4, p);

for itr = 1:p
    approx = (foo_0(x+h) - foo_0(x)) / h;
    error(1, itr) = abs(derivative1 - approx);
    approx = (foo_0(x) - foo_0(x - h)) / h;
    error(2, itr) = abs(derivative1 - approx);
    approx = (foo_0(x + h) - foo_0(x - h)) / (2 * h);
    error(3, itr) = abs(derivative1 - approx);
    approx = (foo_0(x + h) - 2 * foo_0(x) + foo_0(x - h)) / h^2;
    error(4, itr) = abs(derivative2 - approx);
    
    approx = (f_0(x_s + h) - f_0(x_s)) / h;
    error2(1, itr) = abs(derivative1_s - approx);
    approx = (f_0(x_s) - f_0(x_s - h)) / h;
    error2(2, itr) = abs(derivative1_s - approx);
    approx = (f_0(x_s + h) - f_0(x_s - h)) / (2 * h);
    error2(3, itr) = abs(derivative1_s - approx);
    approx = (f_0(x_s + h) - 2 * f_0(x_s) + f_0(x_s - h)) / h^2;
    error2(4, itr) = abs(derivative2_s - approx);
    
    steps(itr) = h;
    h = h * 10;
end

str = 'Аппроксимация первых производных x*ln(x) и cos(2x)';
str_er1 = 'Ошибка (x*ln(x))';
str_er2 = 'Ошибка (cos(2x))';

figure;
loglog(steps, error(1,:));
hold on;
grid on;
loglog(steps, error2(1,:));
loglog(steps, steps, 'go', 'MarkerSize', 2);
legend(str_er1 , str_er2, 'h', 'Location', 'southeast');
xlabel('Шаг');
ylabel('Ошибка');
title(str);

figure;
loglog(steps, error(2,:));
hold on;
grid on;
loglog(steps, error2(2,:));
loglog(steps, steps, 'go', 'MarkerSize', 2);
legend(str_er1, str_er2, 'h', 'Location', 'southeast');
xlabel('Шаг');
ylabel('Ошибка');
title(str);

figure;
loglog(steps, error(3,:));
hold on;
grid on;
loglog(steps, error2(3,:));
loglog(steps, steps.^2, 'go', 'MarkerSize', 2);
legend(str_er1, str_er2, 'h^2', 'Location', 'southeast');
xlabel('Шаг');
ylabel('Ошибка');
title(str);

figure;
loglog(steps, error(4,:));
hold on;
grid on;
loglog(steps, error2(4,:));
loglog(steps, steps.^2, 'go', 'MarkerSize', 2);
legend(str_er1, str_er2, 'h^2', 'Location', 'southeast');
xlabel('Шаг');
ylabel('Ошибка');
title('Аппроксимация вторых производных x*ln(x) и cos(2*x)');
