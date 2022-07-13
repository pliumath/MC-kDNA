function visualizenetwork(L,C,A)
%VISUALIZENETWORK plots the minicircle network.

if sum(sum(A == 1)) + sum(sum(A == 0)) == size(A,1)^2

    n = size(L,1);

    hold on
    G = graph(A);
    plot(G,'XData',L(:,1),'YData',L(:,2),'LineWidth',2,'NodeLabel',{}) %plot linking state
    for i = 1:n
        plot3(C(:,1,i),C(:,2,i),C(:,3,i),'color',[177,177,177]./256,'LineWidth',1) %plot circles
    end
    grid on
    axis equal

else

    sc = 100;
    n = size(L,1);
    clr = copper(sc);
    colormap(copper);
    cb = colorbar;
    clim([0,pi/2]);
    cb.Ticks = [0,pi/6,pi/4,pi/3,pi/2];
    cb.TickLabels = {'0','\pi/6','\pi/4','\pi/3','\pi/2'};
    cb.Label.String = 'Angle between minicircles';
    cb.FontSize = 10;

    hold on
    for i = 1:n
        
        plot3(C(:,1,i),C(:,2,i),C(:,3,i),'color',[177,177,177]./256,'LineWidth',1) %plot circles

        if i < n
            for j = (i+1):n
                
                ang = A(i,j);

                if ang ~= 0 
                    c = ceil(sc*((ang)/(pi/2)));
                    plot(L([i,j],1),L([i,j],2),'LineWidth',4,'Color',clr(c,:));
                end

            end
        end

    end
    plot(L(:,1),L(:,2),'k.','MarkerSize',14)
    grid on
    axis equal

end


end