% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
axis equal
hold on
grid off
set(axes1,'XTick',[],'YTick',[])
annotation(figure1,'textarrow',[0.15 0.25],[0.15 0.28],'String','Y_s','Color','m');
annotation(figure1,'textarrow',[0.15 0.25], [0.25 0.13],'String','X_s','Color','m');

%linka do bloczka 4
plot([8.8,10.8],[4.6, 2.6],'k', 'LineWidth',2)

%równia
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
annotation(figure1,'textbox', [0.55, 0.75 0.07, 0.05],...
    'String','m_3','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.65, 0.15 0.07, 0.05],...
    'String','\alpha','FontSize',15, 'LineStyle','none');

annotation(figure1,'textbox', [0.4, 0.5 0.07, 0.05],...
    'String','\mu','FontSize',15, 'LineStyle','none');

%% sily
annotation(figure1,'arrow',[0.395 0.3],[0.8 0.93],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.35, 0.85 0.07, 0.05],'String',string(F15),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.425 0.33],[0.54 0.67],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.35, 0.55 0.07, 0.05],'String',string(F14),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.52 0.52],[0.6 0.4],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.52, 0.52 0.07, 0.05],'String',string(F12),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.33 0.455],[0.34 0.5],'Color','r','LineWidth',3);
annotation(figure1,'textbox', [0.42, 0.4 0.07, 0.05],'String',string(F13),...
    'FontSize',15, 'LineStyle','none','Color','r');

annotation(figure1,'arrow',[0.6 0.695],[0.73 0.6],'Color','b','LineWidth',3);
annotation(figure1,'textbox', [0.65, 0.7 0.07, 0.05],'String',string(p8),...
    'FontSize',15, 'LineStyle','none','Color','b');

disp('Fig 4. Free body diagram of the 3rd element');