% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
axis equal;
hold on;
grid off;
set(axes1,'XTick',[],'YTick',[]);
annotation(figure1,'textarrow',[0.78 0.9],[0.2 0.2],'String','X','Color','m');
annotation(figure1,'textarrow',[0.8 0.8], [0.17 0.3],'String','Y','Color','m');

%parametry stale
xc = 0;
yc = 0;
theta = linspace(0,2*pi);
theta1 = linspace(0.5*pi,0.9*pi);

%parametry zadania
R1d = 5;
r1d = 2;

%bloczek - male kolo
x = r1d*cos(theta) + xc;
y = r1d*sin(theta) + yc;
plot(x,y, 'Color', [162/255 20/255 47/255], 'LineWidth',2)

%bloczek - duze kolo 
x = R1d*cos(theta) + xc;
y = R1d*sin(theta) + yc;
plot(x,y,'Color', [162/255 20/255 47/255], 'LineWidth',2)

%% linki
%linka do klocka 2
plot([2,2],  [0, -6],'k', 'LineWidth',2);

%linka do joja 2
plot([-5,-5],[0, -6],'k', 'LineWidth',2);

%linka do bloczka 4
plot([0,6],  [5, 5], 'k', 'LineWidth',2);

%% forces
annotation(figure1,'arrow',[0.49 0.49],[0.55 0.65],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.42, 0.6 0.07, 0.05],'String',string(F1),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.49 0.57],[0.55 0.55],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.5, 0.56 0.07, 0.05],'String',string(F2),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.49 0.49],[0.55 0.45],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.5, 0.45 0.07, 0.05],'String',string(F3),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.8 0.9],[0.925 0.925],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.83, 0.87 0.07, 0.05],'String',string(F4),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.602 0.602],[0.25 0.11],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.62, 0.16 0.07, 0.05],'String',string(F5),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.212 0.212],[0.25 0.11],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.22, 0.16 0.07, 0.05],'String',string(F6),...
    'FontSize',15, 'LineStyle','none','Color','r');

%% acceleration
x = 3.5*cos(theta1) + xc;
y = 3.5*sin(theta1) + yc;
plot(x,y,'b--', 'LineWidth',2)

annotation(figure1,'arrow',[0.48 0.52],[0.8115 0.8115],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.35, 0.8 0.07, 0.05],'String',string(p1),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.8 0.9],[0.8115 0.8115],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.83, 0.76 0.07, 0.05],'String',string(p2),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.68 0.68],[0.25 0.11],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.68, 0.16 0.07, 0.05],'String',string(p3),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.28 0.28],[0.11 0.25],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.28, 0.16 0.07, 0.05],'String',string(p4),...
    'FontSize',15, 'LineStyle','none','Color','b');

%% geometrical and mass parameters
annotation(figure1,'arrow',[0.49 0.39],[0.55 0.48],'Color','k','LineWidth',1);
annotation(figure1,'arrow',[0.49 0.215],[0.55 0.5],'Color','k','LineWidth',1);
annotation(figure1,'textbox', [0.23, 0.4 0.1, 0.1],'String','R1, M1',...
    'FontSize',15, 'LineStyle','none','Color','k');
annotation(figure1,'textbox', [0.4, 0.41 0.1, 0.1],'String','r1, m1',...
    'FontSize',15, 'LineStyle','none','Color','k');

disp('Fig 2. Free body diagram of the 1st element');