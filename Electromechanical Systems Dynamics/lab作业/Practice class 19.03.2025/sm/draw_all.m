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

%1 bloczek - male kolo
x = r1d*cos(theta) + xc;
y = r1d*sin(theta) + yc;
plot(x,y, 'Color', [162/255 20/255 47/255], 'LineWidth',2)

%a bloczek - duze kolo 
x = R1d*cos(theta) + xc;
y = R1d*sin(theta) + yc;
plot(x,y,'Color', [162/255 20/255 47/255], 'LineWidth',2)

%bloczek podpora
plot([-0.4, 0.4, 0, -0.4, -0.6,  0.6],...
     [-0.5,-0.5, 0, -0.5, -0.5, -0.5],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2);
for i=0:5 
    plot([ 0.4-i*0.2, 0.6-i*0.2], [-0.7, -0.5],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2); 
end

%linka do klocka 2
plot([2,2],[0, -8],'k', 'LineWidth',2)

%klocek 2
plot([1,3,3,1,1],[-8, -8, -12, -12, -8],'Color', [0 127/255 0],  'LineWidth',2);

%linka do joja 2
plot([-5,-5],[0, -6],'k', 'LineWidth',2)
plot([-11,-11],[0, -6],'k', 'LineWidth',2)

%jojo
x = r4d*cos(theta) + xc1;
y = r4d*sin(theta) + yc1;
plot(x,y, 'Color', [126/255 47/255 142/255], 'LineWidth',2)

%sufit
plot([-12, -10], [0,0],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2);
 
for i=0:9 
    plot([-12+i*0.2, -11.8+i*0.2], [0, 0.2],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2);
end
 
%linka do bloczka 4
plot([0,8],[5, 5],'k', 'LineWidth',2)
plot([8.8,10.8],[4.6, 2.6],'k', 'LineWidth',2)

%bloczek 4
x = r5d*cos(theta) + xc2;
y = r5d*sin(theta) + yc2;
plot(x,y, 'Color', [162/255 20/255 47/255], 'LineWidth',2)

%bloczek podpora
plot(xc2+[-0.4, 0.4, 0, -0.4, -0.6,  0.6],...
     yc2+[-0.5,-0.5, 0, -0.5, -0.5, -0.5],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2);
 
for i=0:5
    plot(xc2+[ 0.4-i*0.2, 0.6-i*0.2], yc2+[-0.7, -0.5],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2); 
end

%rownia
plot([9, 9, 15, 9], [2,-4, -4, 2],...
     'Color', [0/255 114/255 189/255], 'LineWidth',2);
 
for i=0:0.2:5.5 
    plot([9.4, 9.2]+i, [-4, -4.2],...
        'Color', [0/255 114/255 189/255], 'LineWidth',2);
end
 
%klocek 5
plot([11.6, 9.6, 12.6, 14.6, 11.6],[3.4, 1.4, -1.6, 0.4, 3.4],...
    'Color', [0 127/255 0],  'LineWidth',2); 

%podpisy
annotation(figure1,'arrow',[0.474 0.51],[0.65 0.71]);
annotation(figure1,'arrow',[0.474 0.61],[0.65 0.7]);
annotation(figure1,'arrow',[0.25 0.3],[0.42 0.51]);
annotation(figure1,'arrow',[0.705 0.72],[0.805 0.84]);

annotation(figure1,'textbox', [0.423, 0.86 0.07, 0.05],...
    'String','M_1,R_1','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.435, 0.75 0.07, 0.05],...
    'String','m_1,r_1','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.6621, 0.86 0.07, 0.05],...
    'String','m_2,r_2','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.85, 0.75 0.07, 0.05],...
    'String','m_3','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.53, 0.36 0.07, 0.05],...
    'String','m_4','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.2, 0.56 0.07, 0.05],...
    'String','m_5,r_5','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.85, 0.5 0.07, 0.05],...
    'String','\alpha','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.75, 0.6 0.07, 0.05],...
    'String','\mu','FontSize',15, 'LineStyle','none');

disp('Fig 1. Schema of rigid bodies system');