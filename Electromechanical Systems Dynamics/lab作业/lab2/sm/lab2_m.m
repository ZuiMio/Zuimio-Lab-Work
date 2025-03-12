U_rated = 24;
Ra = 0.35;
La = 3.5e-4;
psi = 0.229183;
J1 = 0.225e-3;
J2 = 1.501e-3;
J = J2;
T_rated = 1.100079;

A = [-Ra/La -psi/La;psi/J 0];
B = [1/La 0;0 -1/J];
C = [0 1];
D = [0 0];
%% simulation 1
U = U_rated;
T_L = 0;


% %% simulation 2
% U = 0;
% T_L = T_rated;

%% Define time limits 用来打印Laplace逆变换后函数的图像，验证

% 欠阻尼
delta1 = (Ra^2-4*La*psi^2/J1)/La^2; % -1.668e+06 < 0
wn = sqrt(psi^2/La/J1);
zeta = Ra/La/2/wn;
wd = wn*sqrt(1-zeta^2);
% W1_J1 = U_rated/psi.*(1-exp(-zeta*wn.*t1)*(cos(wd.*t1)+zeta/sqrt(1-zeta).*sin(wd.*t1)));

% 过阻尼
delta2 = (Ra^2-4*La*psi^2/J2)/La^2; % 6.001e+05 > 0
p = [1, Ra/La, psi^2/La/J2];
s = abs(roots(p));
wn2 = sqrt(psi^2/La/J2);
zeta2 = Ra/sqrt(La/J2*psi^2)/2;
% W1_J2 = U_rated/psi.*(1+wn2/2/sqrt(zeta2.^2-1).*((exp(-s(1).*t2)/s(1)-exp(-s(2).*t2)/s(2))));


start_time = 0;
stop_time = 0.02;
% Define time step
time_step = 0.0001;
% Define the array of times
t1 = start_time:time_step:stop_time;
% Define the function
W1_J1 = U_rated/psi.*(1-exp(-zeta.*wn.*t1).*(cos(wd.*t1)+zeta/sqrt(1-zeta.^2).*sin(wd.*t1)));% here should be your own calculated time response

t2 = 0: 0.0001: 0.5;
W1_J2 = U_rated/psi.*(1+wn2/2/sqrt(zeta2.^2-1).*(exp(-s(1).*t2)/s(1)-exp(-s(2).*t2)/s(2)));
% Draw the graph of f t
figure(1)
plot(t1, W1_J1, 'Linewidth', 2)
title('J = J1 : underdamped')
grid on

figure(2)
plot(t2, W1_J2, 'Linewidth', 2)
title('J = J2 : overdamp')
grid on

%% bode
numerator = psi/La/J1;
denominator = [1, Ra/La, psi^2/La/J1];

W = tf(numerator, denominator);
figure(3)
bode(W)
grid on

