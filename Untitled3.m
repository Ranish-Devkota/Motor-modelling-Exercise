% Parameters
Cp = 4180;         
rho = 1;         
V = 1;          
T_H = 100;       
T_C = 20;      
F = 1.0;          
A = -F/V;
B = (-A)*T_H - A*T_C;
C = 1;
D = 0;
k = 500;
sys = ss(A, B, C, D);
T_setpoint = 30.0;   
lambda = (T_setpoint - T_C)/(T_H - T_C); %normalize error
c0= k*lambda; %K is tuning factor to lambda
t = linspace(0,100,1000); 
u = lambda*ones(size(t)); %Control input vector
 kp = 1000;
 c= pid(kp);
sys_cl =T_setpoint*feedback(sys*c*c0,.8);
%     t = 0:0.01:5;
%          step(sys_cl,t)
%           grid
 [y, t] = lsim(sys_cl,u,t);
   plot(t,y+T_C,'r');
   xlabel('Time [s]');
  ylabel('Temperature,°C');
title('Temperature Control of a Stirred Mixing Tank');
  grid