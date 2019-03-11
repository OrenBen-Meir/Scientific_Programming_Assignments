x=3;
delta=10^(-11);

disp('g1(x,delta)=')
display(g1(x,delta))

disp('g2(x,delta)=')
display(g2(x,delta))

function returnF1 = f1(x,delta)
    returnF1 = cos(x+ delta) - cos(x);
end
function returnF2 = f2(x,delta)
    returnF2 = - 2*sin(x+ delta/2)*sin(delta/2);
end
function returnG1 = g1(x,delta)
    returnG1=f1(x,delta)/delta + sin(x);
end
function returnG2 = g2(x,delta)
    returnG2=f2(x,delta)/delta + sin(x);
end
