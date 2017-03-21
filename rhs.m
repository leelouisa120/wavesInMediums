function yp = rhs (time,y)
global a0;
global y0;

x = y(1);
real_y = y(2);
a = y(3);
e = 0.001;

%Case 1
c = @(y) -y;
c0 = 1;

%Case 2
% c =@(y) 1 + 0.5*(1+ ((2/pi)*atan((y+5)/e)));
% c0 = c(y0);

%Case 3.1
% c = @ (y) 1+((1/4)*exp(-(y+1)^2));
% c0 = 1+(exp(1)/4);

%Case 3.2
% c = @(y) 1-((1/4)*exp(-(y+1)^2));
% c0 = 1-(exp(1)/4);

cdiff = @(y) (c(y+10^-12)-c(y))/10^-12;


dx = c(real_y)* sin(a); %dx/dt
dy = -c(real_y)* cos(a); %dy/dt
da = -c(real_y)*cdiff(real_y)*(sin(a0)/c0); % da/dt

yp(1,1) = dx;
yp(2,1) = dy;
yp(3,1) = da;

end



