% 清除工作区和命令窗口
clc;


U_rated = 24;
U = U_rated;
Ra = 0.35;
La = 0.00035;
psi = 0.229183118052329;
JM = 0.00150071147429108;
JL = 0.00450213442287325;
J = JL;
b = 0.06;
k = 1700;


A = [-Ra/La -psi/La 0 0; psi/JM -b/JM b/JM -1/JM; 0 b/JL -b/JL 1/JL; 0 k -k 0];
B = [1/La; 0; 0; 0;];
C = [0 1 0 0];
D = 0;

%% bode
% numerator = [psi*JL psi*b psi*k];
numerator = [psi*JL psi*b psi*k];
denominator = [JL*JM*La (JL*JM*Ra + JL*La*b + JM*La*b) (JL*psi^2 + JL*Ra*b + JM*Ra*b + JL*La*k + JM*La*k) (psi^2*b + JL*Ra*k + JM*Ra*k) psi^2*k];

W = tf(numerator, denominator);
figure(1)
bode(W)
grid on

%% Find the frequency response function of the system from simulation data

u = out.INPUT(:, 1);
y = reshape(out.OUTPUT, [], 1);
Ts = 1e-3;
[txy, f] = tfestimate(u,y,[],[],[], (1 / Ts));
om = 2 * pi * f;
L = 20 * log10(abs(txy));
figure(2);
plot(om, L, '-k');
xlim([0.1, 5000]);
xlabel('\omega_M , rad/s')
ylabel('L, dB')
ax= gca;
set(ax, 'XScale', 'log')
grid on
hold all

% Define number of poles and number of zeros
pole_num = 4;
zero_num = 2;

sys_fr = idfrd(txy,om,Ts);
id_freq_tf = tfest(sys_fr, pole_num, zero_num); 
W_ident_1 = tf(id_freq_tf.num, id_freq_tf.den);
bodemag(W_ident_1, '--r'); 
grid on

%% 定义传递函数的分母表达式

% % 定义符号变量
% syms s U Ia Omega_M Omega_L Ts La Ra Psi JM JL b k
% % 电枢电流方程
% eq1 = La*s*Ia == U - Ra*Ia - Psi*Omega_M;
% % 电机角速度方程
% eq2 = JM*s*Omega_M == Psi*Ia - Ts - b*(Omega_M - Omega_L);
% % 负载角速度方程
% eq3 = JL*s*Omega_L == Ts + b*(Omega_M - Omega_L);
% % 转矩方程
% eq4 = s*Ts == k*(Omega_M - Omega_L);
% % 解方程组
% sol = solve([eq1, eq2, eq3, eq4], [Ia, Omega_M, Omega_L, Ts]);
% % 提取 Omega_M 和 Omega_L
% Omega_M_s = sol.Omega_M;
% Omega_L_s = sol.Omega_L;
% % 计算传递函数
% W1 = Omega_M_s / U;
% W2 = Omega_L_s / U;
% % 显示传递函数
% % disp('W1(s) = ');
% % pretty(W1);
% % disp('W2(s) = ');
% % pretty(W2);
% % 如果需要简化传递函数
% W1_simplified = simplify(W1);
% W2_simplified = simplify(W2);
% disp('Simplified W1(s) = ');
% pretty(W1_simplified);
% disp('Simplified W2(s) = ');
% pretty(W2_simplified);
% 
% % denominator = JL*JM*La*s^4 + ...
% %               (JL*JM*Ra + JL*La*b + JM*La*b)*s^3 + ...
% %               (JL*Psi^2 + JL*Ra*b + JM*Ra*b + JL*La*k + JM*La*k)*s^2 + ...
% %               (Psi^2*b + JL*Ra*k + JM*Ra*k)*s + ...
% %               Psi^2*k;
% 
% % [JL*JM*La (JL*JM*Ra + JL*La*b + JM*La*b) (JL*psi^2 + JL*Ra*b + JM*Ra*b + JL*La*k + JM*La*k) (psi^2*b + JL*Ra*k + JM*Ra*k) psi^2*k]

%% Define time limits 用来打印Laplace逆变换后函数的图像，验证
% 
% % 欠阻尼
% delta1 = (Ra^2-4*La*psi^2/J1)/La^2; % -1.668e+06 < 0
% wn = sqrt(psi^2/La/J1);
% zeta = Ra/La/2/wn;
% wd = wn*sqrt(1-zeta^2);
% % W1_J1 = U_rated/psi.*(1-exp(-zeta*wn.*t1)*(cos(wd.*t1)+zeta/sqrt(1-zeta).*sin(wd.*t1)));
% 
% % 过阻尼
% delta2 = (Ra^2-4*La*psi^2/J2)/La^2; % 6.001e+05 > 0
% p = [1, Ra/La, psi^2/La/J2];
% s = abs(roots(p));
% wn2 = sqrt(psi^2/La/J2);
% zeta2 = Ra/sqrt(La/J2*psi^2)/2;
% % W1_J2 = U_rated/psi.*(1+wn2/2/sqrt(zeta2.^2-1).*((exp(-s(1).*t2)/s(1)-exp(-s(2).*t2)/s(2))));
% 
% 
% start_time = 0;
% stop_time = 0.02;
% % Define time step
% time_step = 0.0001;
% % Define the array of times
% t1 = start_time:time_step:stop_time;
% % Define the function
% W1_J1 = U_rated/psi.*(1-exp(-zeta.*wn.*t1).*(cos(wd.*t1)+zeta/sqrt(1-zeta.^2).*sin(wd.*t1)));% here should be your own calculated time response
% 
% t2 = 0: 0.0001: 0.5;
% W1_J2 = U_rated/psi.*(1+wn2/2/sqrt(zeta2.^2-1).*(exp(-s(1).*t2)/s(1)-exp(-s(2).*t2)/s(2)));
% % Draw the graph of f t
% figure(1)
% plot(t1, W1_J1, 'Linewidth', 2)
% title('J = J1 : underdamped')
% grid on
% 
% figure(2)
% plot(t2, W1_J2, 'Linewidth', 2)
% title('J = J2 : overdamp')
% grid on

