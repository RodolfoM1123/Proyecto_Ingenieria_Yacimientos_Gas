function x=mu_g(P,Z,Mg,T)
H=1.494*10^-3*P*Mg/Z/T/10.73;
k1=(9.4*10^-4+2*Mg*10^-6)/(209+19*Mg+T)*T^1.5;
XX=3.5+0.01*Mg+986/T;
YY=2.4-0.2*XX;
x=k1*exp(XX*H^YY);
end
