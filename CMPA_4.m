clc
clear
close all
Is=0.01e-12;
Ib=0.1e-12;
Vb=1.3;
Gp=0.1;
V=linspace(-1.95, 0.7,200);
I=Is.*(exp(48.*V)-1)+Gp.*V-Ib.*(exp(-48.*(V+Vb))-1);
I_noise=I+0.1*I.*(rand(size(I))-0.5)*2;
inputs=V.';
targets=I_noise.';
hiddenLayerSize=10;
net=fitnet(hiddenLayerSize);
net.divideParam.trainRatio=70/100;
net.divideParam.valRatio=15/100;
net.divideParam.testRatio=15/100;
[net,tr]=train(net,inputs,targets);
outputs=net(inputs);
errors=gsubtract(outputs,targets);
performance=perform(net,targets,outputs);
view(net);
Inn=outputs;
subplot(2,1,1)
plot(V.',I_noise.')
hold on
plot(inputs,Inn,'--')
xlabel('V')
ylabel('I')
legend('data','Neural Net'),legend boxoff
hold off
subplot(2,1,2)
semilogy(inputs,abs(I_noise))
hold on
semilogy(inputs,abs(Inn),'--')
xlabel('V')
ylabel('abs(I)')
legend('data','Neural Net'),legend boxoff