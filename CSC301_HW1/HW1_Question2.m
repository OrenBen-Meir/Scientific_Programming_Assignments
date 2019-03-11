format long;
x= 1.2;
disp('f(x) = sin(x)');
fprintf('let x = %d\n',x);
for k=0:20
    h = 10^(-k);
    fprintf("h=10^(-%d), f'(x) = ",k);
    disp(derivativeSinX(x,h));
end
function returnF2 = f2(x,h)
    returnF2 = 2*cos(x + h/2)*sin(h/2);
end
%Approximates derivative of sin(x) for a small value of h
function returnSinDerivative = derivativeSinX(x,h)
    returnSinDerivative = f2(x,h)/h;
end