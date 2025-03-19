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


%linka do klocka 2
plot([2,2],[-4, -8],'k', 'LineWidth',2)

%klocek 2
plot([1,3,3,1,1],[-8, -8, -12, -12, -8],'Color', [0 127/255 0],  'LineWidth',2);

%podpisy
annotation(figure1,'textbox', [0.45, 0.14 0.07, 0.05],...
    'String','m_4','FontSize',15, 'LineStyle','none');

annotation(figure1,'arrow',[0.518 0.518],[0.85 0.95],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.53, 0.86 0.07, 0.05],'String',string(F16),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.518 0.518],[0.3 0.15],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.53, 0.22 0.07, 0.05],'String',string(F17),...
    'FontSize',15, 'LineStyle','none','Color','r');

%%przyspieszenie

annotation(figure1,'arrow',[0.618 0.618],[0.4 0.3],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.63, 0.35 0.07, 0.05],'String',string(p9),...
    'FontSize',15, 'LineStyle','none','Color','b');

disp('Fig 5. Free body diagram of the 4th element');