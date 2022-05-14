function x = Dranchuk(Pr,Tr)
    z=0.8;
    za=0;
    A = [0.3265 -1.07 -0.5339 0.01569 -0.05165 0.5475 -0.7361 0.1844 0.1056 0.6134 0.721];
    err=abs(za-z);
   while err>1*10^-4
    rho = 0.27*Pr/(z*Tr);
    c1= A(1)+A(2)/Tr+A(3)/Tr^3+A(4)/Tr^4+A(5)/Tr^5;
    c2= A(6)+A(7)/Tr+A(8)/Tr^2;
    c3= A(9)*(A(7)/Tr+A(8)/Tr^2);
    c4= A(10)*(1+A(11)*rho^2)*(rho^2/Tr^3)*exp(-A(11)*rho^2);
    f = z-(1+c1*rho+c2*rho^2-c3*rho^5+c4);
    df= 1+c1*rho/z+2*c2*rho^2/z-5*c3*rho^5/z+2*A(10)*rho^2/Tr^3/z*(1+A(11)*rho^2-(A(11)*rho^2)^2)*exp(-A(11)*rho^2);
    za=z-f/df;
    err=abs(za-z);
    z=za;
   end
   
   x=z
   
end

