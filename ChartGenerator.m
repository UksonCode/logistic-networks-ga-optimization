classdef ChartGenerator
    properties
        time
        simTime
        n
        x
        u_hist
        d
        h
    end
    methods
        function obj = ChartGenerator(time, simTime, n, x, u_hist, d, h)
            if nargin > 0
                obj.time = time;
                obj.simTime = simTime;
                obj.n = n;
                obj.x = x;
                obj.u_hist = u_hist;
                obj.d = d;
                obj.h = h;
            end
        end
        
        function obj = stock_level(obj, n)
            f=figure(n);
            set(f, 'Color', [1 1 1]);
            
            if obj.n == 3
                hh=plot(obj.time, obj.x(1,1:obj.simTime), 'r-', ...
                    obj.time, obj.x(2,1:obj.simTime), 'k:', ...
                    obj.time, obj.x(3,1:obj.simTime), 'b-' ...
                   );
            else
                hh=plot(obj.time, obj.x(1,1:obj.simTime), 'r-', ...
                   obj.time, obj.x(2,1:obj.simTime), 'g:', ...
                   obj.time, obj.x(3,1:obj.simTime), 'b-', ...
                   obj.time, obj.x(4,1:obj.simTime), 'k:', ...
                   obj.time, obj.x(5,1:obj.simTime), 'r-', ...
                   obj.time, obj.x(6,1:obj.simTime), 'b:' ...
                   );
            end
            
            for index=1:obj.n
                set(hh(index), 'LineWidth', index);
            end
            f=xlabel('Period [t]');
            set(f, 'FontSize', 12);
            f=ylabel('Stock level l(t) [units]');
            set(f, 'FontSize', 12);
            
            if obj.n == 3
                legend('l_1', ...
                       'l_2', ...
                       'l_3');
            else
               legend('l_1', ...
               'l_2', ...
               'l_3', ...
               'l_4', ...
               'l_5', ...
               'l_6');
            end
            
            legend boxoff
            set(gca,'XLim',[0 obj.simTime], 'Box', 'off', 'FontSize', 12);
        end
        
        function obj = order_quantity(obj, n)
            f=figure(n);
            set(f, 'Color', [1 1 1]);

            if obj.n == 3
            hh=plot(obj.time, obj.u_hist(1,1:obj.simTime), 'r-', ...
                    obj.time, obj.u_hist(2,1:obj.simTime), 'k:', ...
                    obj.time, obj.u_hist(3,1:obj.simTime), 'b-' ...
                   );
            else
            hh=plot(obj.time, obj.u_hist(1,1:obj.simTime), 'r-', ...
                   obj.time, obj.u_hist(2,1:obj.simTime), 'g:', ...
                   obj.time, obj.u_hist(3,1:obj.simTime), 'b-', ...
                   obj.time, obj.u_hist(4,1:obj.simTime), 'k:', ...
                   obj.time, obj.u_hist(5,1:obj.simTime), 'r-', ...
                   obj.time, obj.u_hist(6,1:obj.simTime), 'b:' ...
                   );
            end
               
            for index=1:obj.n
                set(hh(index), 'LineWidth', index);
            end
            f=xlabel('Period [t]');
            set(f, 'FontSize', 12);
            f=ylabel('Internal order quantity o(t) [units]');
            set(f, 'FontSize', 12);
            if obj.n == 3
            legend('o_1', ...
                   'o_2', ...
                   'o_3');
            else
            legend('o_1', ...
                   'o_2', ...
                   'o_3', ...
                   'o_4', ...
                   'o_5', ...
                   'o_6');
            end
            legend boxoff
            set(gca,'XLim',[0 obj.simTime], 'Box', 'off', 'FontSize', 12);
        end
        
        function obj = demand(obj, n)
            f=figure(n);
            set(f, 'Color', [1 1 1]);

            if obj.n == 3
            hh=plot(obj.time, obj.d(1,1:obj.simTime), 'r-', ...
                    obj.time, obj.d(2,1:obj.simTime),  'k:', ...
                    obj.time, obj.d(3,1:obj.simTime), 'b-' ...
                   );
            else
            hh=plot(obj.time, obj.d(1,1:obj.simTime), 'r-', ...
                   obj.time, obj.d(2,1:obj.simTime),  'g:', ...
                   obj.time, obj.d(3,1:obj.simTime), 'b-', ...
                   obj.time, obj.d(4,1:obj.simTime), 'k:', ...
                   obj.time, obj.d(5,1:obj.simTime),  'r-', ...
                   obj.time, obj.d(6,1:obj.simTime), 'b:' ...
                   );
            end
            
            for index=1:obj.n
                set(hh(index), 'LineWidth', index);
            end
            f=xlabel('Period [t]');
            set(f, 'FontSize', 12);
            f=ylabel('Demand d(t) [units]');
            set(f, 'FontSize', 12);
            if obj.n == 3
            legend('d_1', ...
                   'd_2', ...
                   'd_3');
            else
            legend('d_1', ...
                   'd_2', ...
                   'd_3', ...
                   'd_4', ...
                   'd_5', ...
                   'd_6');
            end
            legend ('Location','Best');
            legend boxoff
            set(gca,'XLim',[0 obj.simTime], 'Box', 'off', 'FontSize', 12);
        end

        function obj = satisfied_demand(obj, n)
            f=figure(n);
            set(f, 'Color', [1 1 1]);

            if obj.n == 3
            hh=plot(obj.time, obj.h(1,1:obj.simTime), 'r-', ...
                    obj.time, obj.h(2,1:obj.simTime), 'k:', ...
                    obj.time, obj.h(3,1:obj.simTime), 'b-' ...
                   );
            else
            hh=plot(obj.time, obj.h(1,1:obj.simTime), 'r-', ...
                   obj.time, obj.h(2,1:obj.simTime), 'g:', ...
                   obj.time, obj.h(3,1:obj.simTime), 'b-', ...
                   obj.time, obj.h(4,1:obj.simTime), 'k:', ...
                   obj.time, obj.h(5,1:obj.simTime), 'r-', ...
                   obj.time, obj.h(6,1:obj.simTime), 'b:' ...
                   );
            end
            
            for index=1:obj.n
                set(hh(index), 'LineWidth', index);
            end
            f=xlabel('Period [t]');
            set(f, 'FontSize', 12);
            f=ylabel('Satisfied demand s(t) [units]');
            set(f, 'FontSize', 12);
            if obj.n == 3
            legend('s_1', ...
                   's_2', ...
                   's_3');
            else
            legend('sd_1', ...
                   'sd_2', ...
                   'sd_3', ...
                   'sd_4', ...
                   'sd_5', ...
                   'sd_6');
            end
            legend ('Location','Best');
            legend boxoff
            set(gca,'XLim',[0 obj.simTime], 'Box', 'off', 'FontSize', 12);
        end
    end
end