% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
axis equal;
hold on;
grid off;
set(axes1,'XTick',[],'YTick',[]);
annotation(figure1,'textarrow',[0.18 0.3],[0.2 0.2],'String','X','Color','m');
annotation(figure1,'textarrow',[0.2 0.2], [0.17 0.3],'String','Y','Color','m');


%parametry stale
xc = 0;
yc = 0;
theta = linspace(0,2*pi);
xc1 = -8;
yc1 = -6;
xc2 = 8;
yc2 = 4;

%parametry zadania
R1d = 5;
r1d = 2;
r4d = 3;
r5d = 1;

%linka do joja 2
plot([-5,-5],[0, -6],'k', 'LineWidth',2)
plot([-11,-11],[0, -6],'k', 'LineWidth',2)

%jojo
x = r4d*cos(theta) + xc1;
y = r4d*sin(theta) + yc1;
plot(x,y, 'Color', [126/255 47/255 142/255], 'LineWidth',2)

%podpisy
annotation(figure1,'arrow',[0.53 0.4],[0.38 0.18]);

annotation(figure1,'textbox', [0.45, 0.2 0.07, 0.05],...
    'String','m_5,r_5','FontSize',15, 'LineStyle','none');

%% przyspieszenia
theta1 = linspace(1.5*pi,2.8*pi);
x = 0.5*cos(theta1) - 11;
y = 0.5*sin(theta1) - 6;
plot(x,y,'b--', 'LineWidth',2)
plot([-5, -11, -5],[-6, -6, -4],'b--', 'LineWidth',2)

annotation(figure1,'arrow',[0.33 0.3],[0.43 0.42],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.27, 0.35 0.07, 0.05],'String',string(p10),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.53 0.53],[0.38 0.47],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.55, 0.4 0.07, 0.05],'String',string(p11),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.735 0.735],[0.38 0.56],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.75, 0.4 0.07, 0.05],'String',string(p12),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.327 0.327],[0.8 0.93],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.33, 0.85 0.07, 0.05],'String',string(F19),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.735 0.735],[0.8 0.93],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.74, 0.85 0.07, 0.05],'String',string(F20),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.53 0.53],[0.38 0.25],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.53, 0.3 0.07, 0.05],'String',string(F18),...
    'FontSize',15, 'LineStyle','none','Color','r');


disp('Fig 6. Free body diagram of the 5th element');