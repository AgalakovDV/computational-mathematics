function[] = Part2(length)

format compact;
a = 0;
b = 1;
h = zeros(1, length);
error = zeros(1, length);

for itr = 1:length
    h(itr) = 10^(-itr);
    x = a + 2*h(itr) : h(itr) : b - 2*h(itr);
%   число отрезков
    n = round((b-a)/h(itr));
    y = [myFoo(a,h(itr)), 2*h(itr)^2*(exp(x).*cos(x)), myFoo(b,-h(itr))];

    first_arr = ones(1, n - 1);
    second_arr = first_arr;
    third_arr = -2 * first_arr;
    uu = zeros(1, n - 1);
    first_arr(1) = 0;
    second_arr(end) = 0;
    
    for i = 2 : (n - 1)
        st = first_arr(i) / third_arr(i-1);
        third_arr(i) = third_arr(i) - st * second_arr(i-1);
        y(i) = y(i) - st * y(i-1);
    end;
        
    uu(n-1) = y(n-1) / third_arr(n-1);

    for i = 1 : (n-2)
        uu(n-1-i) = (y(n-1-i) - second_arr(n-1-i) * uu(n-i))/third_arr(n-1-i);
    end;

    x2 = [a + h(itr), x, b - h(itr)];
    far = (sin(x2)) .* (exp(x2));
    ker = abs(far - uu);
    error(itr) = max(ker);
end

%error

figure;
loglog(h, error, 'r');
hold on;
grid on;
loglog(h, h.^2);
legend('Fixed point error', 'h', 'Location', 'north');
xlabel('Step');
ylabel('Error');
