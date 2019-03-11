clc;

%Sets up the original points of function V=f(x,y)=sin(X)sin(Y)
[X,Y] = meshgrid(-8:8);
V = sin(X).*sin(Y); 

%Plots the function V giving a monochrome image
figure
surf(X,Y,V)
title('Original picture');

%Makes the photo 2^2 times larger using interp2 once
N = 2;
ResolutionMultiplier = 2^N;
h = 1/ResolutionMultiplier;
[Xq,Yq] = meshgrid(-8:h:8);
Vq = interp2(X,Y,V,Xq,Yq);
figure
surf(Xq,Yq,Vq);
title('Picture after using interp2 once to make the picture 2^2 times larger');

%Makes the photo 2^2 times larger using interp2 2 times
N=2;
Xt = X;
Yt = Y;
Vt = V;
for i=1:N
    ResolutionMultiplier = 2^i;
    h = 1/ResolutionMultiplier;
    [Xn, Yn] = meshgrid(-8:h:8);
    Vt= interp2(Xt,Yt,Vt,Xn,Yn);
    Xt = Xn;
    Yt = Yn;
end
figure
surf(Xt,Yt,Vt);
title('Picture after using interp2 to make the picture 2^2 times larger by iterating 2 times');

%finding the difference between the two methods
figure
surf(Xt,Yt,Vt-Vq);
title('Vt-Vq');
