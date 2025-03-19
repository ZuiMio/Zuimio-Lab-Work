% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
axis equal
hold on
grid off
set(axes1,'XTick',[],'YTick',[])
annotation(figure1,'textarrow',[0.18 0.3],[0.2 0.2],'String','X','Color','m');
annotation(figure1,'textarrow',[0.2 0.2], [0.17 0.3],'String','Y','Color','m');

%parametry stale
xc2 = 8;
yc2 = 4;
theta = linspace(0,2*pi);

%parametry zadania
r2d = 3;
 
%linka do bloczka 2
plot([6,8],[5, 5],'k', 'LineWidth',2)
plot([8.8,9.8],[4.6, 3.6],'k', 'LineWidth',2)

%bloczek 2
x = r5d*cos(theta) + xc2;
y = r5d*sin(theta) + yc2;
plot(x,y, 'Color', [162/255 20/255 47/255], 'LineWidth',2)
 

%podpisy
annotation(figure1,'arrow',[0.538 0.4],[0.51 0.32]);

annotation(figure1,'textbox', [0.36, 0.38 0.07, 0.05],...
    'String','m_2,r_2','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.85, 0.4 0.07, 0.05],...
    'String','\alpha','FontSize',15, 'LineStyle','none');

%% sily
annotation(figure1,'arrow',[0.538 0.64],[0.51 0.51],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.47, 0.57 0.07, 0.05],'String',string(F8),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.538 0.538],[0.51 0.65],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.55, 0.46 0.07, 0.05],'String',string(F7),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.538 0.538],[0.51 0.36],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.48, 0.42 0.07, 0.05],'String',string(F9),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.23 0.13],[0.79 0.79],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.15, 0.73 0.07, 0.05],'String',string(F10),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.85 0.91],[0.485 0.405],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.84, 0.5 0.07, 0.05],'String',string(F11),...
    'FontSize',15, 'LineStyle','none','Color','r');

%% przyspieszenia
theta1 = linspace(0.5*pi,0.9*pi);
x = 0.75*cos(theta1) + xc2;
y = 0.75*sin(theta1) + yc2;
plot(x,y,'b--', 'LineWidth',2)

annotation(figure1,'arrow',[0.52 0.56],[0.72 0.72],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.4, 0.68 0.07, 0.05],'String',string(p5),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.13 0.23],[0.72 0.72],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.15, 0.675 0.07, 0.05],'String',string(p6),...
    'FontSize',15, 'LineStyle','none','Color','b');

annotation(figure1,'arrow',[0.85 0.91],[0.395 0.315],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.84, 0.32 0.07, 0.05],'String',string(p7),...
    'FontSize',15, 'LineStyle','none','Color','b');

disp('Fig 3. Free body diagram of the 2nd element');