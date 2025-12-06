% MATLAB Code for Variant 92 Discrete Transfer Function Calculation
clear; clc;

% Given parameters for Variant 92
T = 0.003;      % Sampling time
K2 = 320;       % Gain for W2
tau2 = 0.15;    % Time constant for W2  
K3 = 0.25;      % Gain for W3 (integrator)

% Continuous transfer function
s = tf('s');
W_cont = (K2/(tau2*s + 1)) * (K3/s);
fprintf('Continuous transfer function:\n');
%% 

% State-space representation
A_H = [0, K3; 0, -1/tau2];
B_H = [0; K2/tau2];
C = [1, 0];
D = 0;

fprintf('\nContinuous state matrices:\n');
fprintf('A_H = \n'); disp(A_H);
fprintf('B_H = \n'); disp(B_H);
fprintf('C = \n'); disp(C);

%% 4. Transfer function (discrete)

% Discretization using exact method
sys_cont = ss(A_H, B_H, C, D);
sys_disc = c2d(sys_cont, T, 'zoh');

fprintf('\nDiscrete state matrices:\n');
fprintf('A = \n'); disp(sys_disc.A);
fprintf('B = \n'); disp(sys_disc.B);
fprintf('C = \n'); disp(sys_disc.C);

%% 
% ============================================================
% PI Controller Synthesis - Reference Model Approach
% ============================================================
% Given performance specifications
ts = 0.105;     % Transition time (s)
sigma = 35;     % Overshoot (%)

% Calculate characteristic frequency for 3rd order binomial system
w0 = 9 / ts;
fprintf('Characteristic frequency w0 = %.4f rad/s\n', w0);

% Continuous-time reference model poles (all identical for binomial)
lambda_cont = -w0 * ones(3,1);
fprintf('Continuous poles: λ1,2,3 = %.4f\n', lambda_cont(1));

%% Solve Sylvester Equation
% Sylvester equation: A*M - M*Gamma = B*H
% 扩展系统矩阵以包含积分器
A = sys_disc.A;
B = sys_disc.B;
C = sys_disc.C;
A_ext = [A, zeros(2,1); -C, 1];  % 增加积分器状态
B_ext = [B; 0];                  % 积分器输入为0
C_ext = [C, 0];                  % 输出不变

Gamma_H = [-w0, 1, 0;
           0, -w0, 1;
           0, 0, -w0];
Gamma = expm(Gamma_H * T);
H = [1, 0, 0];


% 求解Sylvester方程 (注意符号)
M = lyap(A_ext, -Gamma, B_ext * H);


%% Calculate Controller Gains
% 计算控制器增益
K = H / M;

% 验证
fprintf('\n验证:\n');
fprintf('参考模型极点: '); disp(eig(Gamma)');
fprintf('闭环系统极点: '); disp(eig(A_ext - B_ext * K)');

% Extract PI controller parameters
k1 = K(1);      % Proportional gain
k2 = K(2);      % State feedback gain  
ki = K(3);      % Integral gain

fprintf('PI Controller Parameters:\n');
fprintf('  k1 (proportional) = %.4f\n', k1);
fprintf('  k2 (state feedback) = %.4f\n', k2);
fprintf('  ki (integral) = %.4f\n', ki);


eig(Gamma)
eig(A_ext-B_ext*K)