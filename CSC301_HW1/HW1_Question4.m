x = 1:.1:5000000; %Distribution of values to calculate s^2

s2 = (length(x)-1)*var(x)/length(x); %The real value of s^2 
%Due to how matlab calculates variance, 
%it needs to be multiplied by (length(x)-1)/length(x)
disp('Finding variance of x = 1:.1:5000000')
fprintf("\nS^2 =");disp(s2);
fprintf("S^2 calculated using method1:");disp(s_squared_method1(x));
fprintf("Absolute error of method1:");disp(abs(s_squared_method1(x)- s2));
fprintf("S^2 calculated using method2:");disp(s_squared_method2(x));
fprintf("Absolute error of method2:");disp(abs(s_squared_method2(x)- s2));

function s2 = s_squared_method1(x)  %calculates s^2 of list x using method1
    n = length(x);
    average_x = mean(x);
    s2 = sum((x-average_x).^2)/n;
end
    
function s2 = s_squared_method2(x)  %calculates s^2 of list x using method2
    n = length(x);
    s2 = sum(x.^2)/n - mean(x)^2;
end