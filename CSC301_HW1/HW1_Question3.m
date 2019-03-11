%Plottting floating point number system (base, t, L, U)=(2, 3, -2, 3)
base = 2;
t = 3;
L = -2;
U = 3;
NumberOfDigits = base^t;
mantisa = (NumberOfDigits/base:NumberOfDigits-1)/NumberOfDigits;
NumberOfExponents = U-L+1;
x = zeros(1,NumberOfExponents*length(mantisa)+1);
for k=1:NumberOfExponents
    x((k-1)*length(mantisa)+2:k*length(mantisa)+1)=mantisa*base^(k+L-1);
end
x = unique(x);
y = zeros(1,length(x));
plot(x,y,'+');
axis([-.5,7.7,-1,1])
grid on;
