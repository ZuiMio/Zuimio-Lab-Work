% Induction Motor Parameters
Tmdl = 1;
U_s = 220;
f_1 = 50;                   % Rated frequency (Hz)
I_n = 11.4;                 % Rated current (A)
Lm = 0.164;                 % Magnetizing inductance (H)
L1 = 0.169;                 % Stator leakage inductance (H)
L2 = 0.172;                 % Rotor leakage inductance (H)
R1 = 1.32;                  % Stator resistance (Ω)
R2 = 0.92;                  % Rotor resistance (Ω)
J = 0.2;                    % Moment of inertia (kg·m²)
Pn = 5500;                  % Rated power (W)
s_n = 0.035;                % Rated slip
z = 2;                      % Number of pole pairs

Lls = L1-Lm;
Llr = L2-Lm;


% Calculated Parameters
Mn = Pn*z/((1-s_n)*2*pi*f_1); % Rated torque (N·m)

% Control Limits
Tn=Pn*z/((1-s_n)*2*pi*f_1); % rated torque, Nm
i_lim = 4.5;                % ratio of max current
m_max = 2;                  % Maximum torque multiplier

w0=2*pi*f_1/z;
T2=L2/R2 ;
K1=Lm/L1 ;
K2=Lm/L2 ;
R_1=(K2^2)*R2+R1 ;
R_2=(K1^2)*R1+R2 ;
L_1=L1*(1-K1*K2) ;
L_2=L2*(1-K1*K2) ;
T_1=L_1/R_1 ;
T_2=L_2/R_2 ;

U=U_s;
U_l = sqrt(3)*U_s; 
U_m=sqrt(2)*U_s;                  % amplitude of rated phase voltage, V
%% 此处科研，别和我做（错）的一样
% 控制参数
%Tmdl = 5;
% V_f_ratio = U_s/f_1; % V/Hz比值
% n_max = (1-s_n)*f_1*60/z; % 最大转速(rpm)
% t_ramp = 3;         % 斜坡时间(s)
% Ramp_slope = n_max/t_ramp;
% % 转速(rpm)转频率(Hz)
% f_r = (n_max/60) * z;  % z为极对数

%%
% X1=2*pi*f_1*(L1-Lm);
% X2k=2*pi*f_1*(L2-Lm);
% Xk=X1+X2k;
% sk=s_n*(m_max + sqrt(m_max*m_max-1));
% sk1=R2/(sqrt(R1^2+Xk^2));
% %sk=sk1;
% Te = 1/(w0*sk);
% %Te=T_2;
% beta = 2*m_max*Mn/(w0*sk);
% J_m=J;
% U=220;
% Tm = J/beta;
% 
% m1=3;
% Um=220;
% omega_1=2*pi*f_1/z;
% c1=1;
% x1sig=X1;
% x2sig_priv=X2k;
% M_max_th=m1*(Um^2)/(2*omega_1*c1*(x1sig+c1*x2sig_priv));