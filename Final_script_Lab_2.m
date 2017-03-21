%% Number 1: Numerical vs. Analytical Solution
clear all;
clc
close all;

% Define global variables to access in rhs
% global a0;
% a0 = pi/4;
% 
% % Initial Conditions for ode45
% y_init = [0;-1;pi/4];
% time_interval = [0, 20];
% 
% options = odeset('RelTol',1e-6);
% [time_out, y_out] = ode45(@rhs, time_interval, y_init, options);
% 
% % Plotting Numerical Solution
% n1 = plot(time_out,y_out(:,1));
% hold on;
% n2 = plot(time_out,y_out(:,2));
% hold on;
% n3 = plot(time_out,y_out(:,3));
% hold on;
% legend([n1,n2,n3],'x','y','alpha');
% title('X, Y, and Alpha vs. Time');
% xlabel('time');
% figure;
% 
% n = plot(y_out(:,1),y_out(:,2),'linewidth',2);
% title('Numerical and Analytical Solution');
% xlabel('x');
% ylabel('y');
% hold on;
% 
% % Plotting Analytical Solution
% y2 =@(x) -sqrt(2-(x-1).^2);
% a = plot(y_out(:,1),y2(y_out(:,1)),'o-');
% legend([n,a],'Numerical Solution','Analytical Solution');
% hold off;

%% Number 2: Plotting Numerical Solution
% % Define global variables to access in rhs
% global a0;
% a0 = pi/4;
% global y0;
% y0 = -1;
% 
% % Initial Conditions for ode50
% y_init = [0;-1;pi/4];
% time_interval = [0, 20];
% 
% options = odeset('RelTol',1e-9);
% [time_out, y_out] = ode45(@rhs, time_interval, y_init, options);
% 
% % Plotting Numerical Solution
% n1 = plot(time_out,y_out(:,1));
% hold on;
% n2 = plot(time_out,y_out(:,2));
% hold on;
% n3 = plot(time_out,y_out(:,3));
% hold on;
% legend([n1,n2,n3],'x','y','alpha');
% title('X, Y, and Alpha vs. Time');
% xlabel('time');
% figure;
% 
% n = plot(y_out(:,1),y_out(:,2),'linewidth',2);
% title('Numerical Solution');
% xlabel('x');
% ylabel('y');
% hold on;

%% Number 2: Plotting c(y) by y
% 
% % Defining y values to calculate c values
% real_y = -1:-0.01:-7;
% 
% % Calculating c with different epsilon
% c1 = 1 + 0.5*(1+ ((2/pi)*atan((real_y+5)/0.1)));
% c2 = 1 + 0.5*(1+ ((2/pi)*atan((real_y+5)/0.001)));
% 
% % Plotting Solution
% c1plot = plot(real_y,c1);
% hold on;
% c2plot = plot(real_y,c2);
% title('Smooth Rapid Transition: c(y) vs. y');
% xlabel('y');
% ylabel('c(y)');
% legend([c1plot, c2plot],'Eps = 0.1', 'Eps = 0.001');

%% Number 2: Plotting sin(a)/c
% clear all;
% clc
% 
% % Defining global variables to access in rhs
% global a0;
% a0 = pi/4;
% global y0;
% y0 = -1;
% % Initial conditions for ode45
% y_init = [0;-1;pi/4];
% time_interval = [0, 20];
% 
% options = odeset('RelTol',1e-3);
% [time_out, y_out] = ode45(@rhs, time_interval, y_init, options);
% 
% % Plotting sin(a)/c for tolerance of 1e-3
% c =@(y) 1 + 0.5*(1+ ((2/pi)*atan((y+5)/0.001)));
% s1 = plot(time_out,sin(y_out(:,3))./c(y_out(:,2)));
% axis([0 20 0 1]);
% title('sin(alpha)/c vs. Time');
% xlabel('Time');
% ylabel('sin(alpha)/c');
% hold on;
% 
% % Calculating and Plotting sin(a)/c for tolerance of 1e-9
% y_init = [0;-1;pi/4];
% time_interval = [0, 20];
% 
% options = odeset('RelTol',1e-9);
% [time_out, y_out] = ode45(@rhs, time_interval, y_init, options);
% 
% c =@(y) 1 + 0.5*(1+ ((2/pi)*atan((y+5)/0.001)));
% s2 = plot(time_out,sin(y_out(:,3))./c(y_out(:,2)));
% legend([s1,s2],'1e-3', '1e-9');

%% Number 3: Sound Waves with Varying Initial Angles
% clear all;
% clc
% % Defining global variables for access in rhs
% global y0;
% y0 = 0;
% 
% % Initial Conditions
% time_step = 0.01;
% opt = struct ('dt', time_step, 'method', @rk4step);
% 
% % Loop through different initial alpha values
% a = linspace(0,pi/2,100);
% 
% for ii = 1:100
%     global a0;
%     a0 = a(ii);
%     y_init = [0;0;a(ii)];
%     time_interval = [0, 25];
%     
%     [time_out, y_out] = ode (@rhs, time_interval, y_init, opt);
%    
%     % Plotting Solution  
%     plot(y_out(1,:),y_out(2,:));
%     axis([0, 15, -15,0]);
%     xlabel('x');
%     ylabel('y')
%     title('Sound Waves Eq.5')
% %     title('Sound Waves Eq.6')
%     hold on;
% end
