clc, clear, close all
set(0,'DefaultFigureWindowStyle','docked')
Is=0.01e-12;
Ib=0.1e-12;
Vb=1.3;
Gp=0.1; %conductance
V=linspace(-1.95, 0.7,200);
I=Is.*(exp(48.*V)-1)+Gp.*V-Ib.*(exp(-48.*(V+Vb))-1);
I_noise=I+0.2.*I.*rand(size(I)); % add noise
figure (1)
subplot(2,1,1)
plot(V,(I_noise))
figure (1)
hold on
P4=polyfit(V,I_noise,4);
txt1 = sprintf('y = %.4f*x^4 %+.4f*x^3 %+.4f*x^2 %+.4f*x %+.4f', P4(1), P4(2), P4(3),P4(4),P4(5));
plot(V,polyval(P4,V))
P8=polyfit(V,I_noise,8);
txt2 = sprintf('y = %.4f*x^8 %+.4f*x^7 %+.4f*x^6 %.4f*x^5 %+.4f*x^4 %+.4f*x^3 %+.4f*x^2 %+.4f*x %+.4f', P8(1), P8(2), P8(3),P8(4),P8(5),P8(6), P8(7),P8(8),P8(9));
plot(V,polyval(P8,V))
legend('data',txt1,txt2); legend boxoff
xlabel('V')
ylabel('I')
%text(V, I, txt1);
hold off
subplot(2,1,2)
semilogy(V,abs(I_noise))
hold on
P4=polyfit(V,abs(I_noise),4);
caption1 = sprintf('y = %.4f*x^4 %+.4f*x^3 %+.4f*x^2 %+.4f*x %+.4f', P4(1), P4(2), P4(3),P4(4),P4(5));
% text(V, I, caption1);
semilogy(V,abs(polyval(P4,V)))
P8=polyfit(V,abs(I_noise),8);
caption2 = sprintf('y = %.4f*x^8 %+.4f*x^7 %+.4f*x^6 %.4f*x^5 %+.4f*x^4 %+.4f*x^3 %+.4f*x^2 %+.4f*x %+.4f', P8(1), P8(2), P8(3),P8(4),P8(5),P8(6), P8(7),P8(8),P8(9));
semilogy(V,abs(polyval(P8,V)))
legend('data','poly4','poly8');
xlabel('V')
ylabel('abs(I)')

