% text(V, I, caption2);
clc
clear 
close all
set(0,'DefaultFigureWindowStyle','docked')
Is=0.01e-12;
Ib=0.1e-12;
Vb=1.3;
Gp=0.1;
%A=Is;
B=Gp;
%C=Ib;
D=Vb;
V=linspace(-1.95, 0.7,200);
I=Is.*(exp(48.*V)-1)+Gp.*V-Ib.*(exp(-48.*(V+Vb))-1);
I_noise=I+0.1*I.*(rand(size(I))-0.5)*2;
f2=fittype('A*(exp(48*x)-1)+0.1*x-C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
f3=fittype('A*(exp(48*x)-1)+B.*x-C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
f4=fittype('A*(exp(48*x)-1)+B.*x-C*(exp(1.2*(-(x+D))/25e-3)-1)');

ff2=fit(V.',I_noise.',f2);
ff3=fit(V.',I_noise.',f3);
ff4=fit(V.',I_noise.',f4);

If2=ff2(V);
If3=ff3(V);
If4=ff4(V);

subplot(2,1,1)
plot(V.',I_noise)
hold on
plot(V.',If2,'--')
plot(V.',If3)
plot(V.',If4,'k--')
xlabel('V')
ylabel('I')
legend('data','fit2','fit3','fit4'),legend boxoff
hold off 
subplot(2,1,2)
semilogy(V.',abs(I_noise))
hold on
semilogy(V.',abs(If2),'--')
semilogy(V.',abs(If3))
semilogy(V.',abs(If4),'k-')
xlabel('V')
ylabel('abs(I)')
legend('data','fit2','fit3','fit4'),legend boxoff