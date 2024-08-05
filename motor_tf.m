s = tf('s');
J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

P_motor = K/((J*s +b)*(L*s+R)+ K^2);
  motor_ss = ss(P_motor);
  grid
 
linearSystemAnalyzer('step' , P_motor , 0:0.1:5 );
 kp = 100;
 c= pid(kp);
 sys_cl = feedback(P_motor * c , 1);
    t = 0:0.01:5;
         step(sys_cl,t)
          grid
           title('Step Response with Proportional Control')
         
         Kp = 100;
 Ki = 200;
 Kd = 10;
 C = pid(Kp,Ki,Kd);
  sys_cl = feedback(C*P_motor,1);
step(sys_cl,[0:0.1:200])
 grid
 title('PID Control with Small Ki and Small Kd')
