classdef Class_Methods
    
    methods 
        
        
        function y = ricepdf(obj,x,v,s);
            s2 = s.^2; 

        try
            y = (x ./ s2) .*...
                exp(-0.5 * (x.^2 + v.^2) ./ s2) .*...
                besseli(0, x .* v ./ s2);
            y(x <= 0) = 0;
        catch
            error('ricepdf:InputSizeMismatch',...
                'Non-scalar arguments must match in size.');
        end
        
        end
            
        
        function [] = Q6(obj,n,K)
            
           
            LOS_power = sqrt(2*K);
            
            variance = 1;
            sigma = sqrt(variance);

            x = sigma*randn(1,n)+LOS_power;
            y = sigma*randn(1,n);


            z = x+i*y;
            
            figure;
            histogram(abs(z), 'Normalization', 'pdf');
            P = (abs(z).^2); %power
            hold on;
            x = 0:0.01:10;
            plot(x,obj.ricepdf(x,LOS_power,sigma));
            legend('Empirical Rice PDF','Theoretical PDF');
            title('Q6 Ricean Distribution with K = ' + string(K));
            xlabel("x/σ");
            ylabel("f(x)");
            

            figure('Visible','off');
            cdf = cdfplot(P);
            cdf_x = get(cdf, 'XData');
            cdf_y = get(cdf, 'YData');

            figure;
            semilogy((10*log10(cdf_x/(2*variance*(1+K)))), cdf_y)
            grid on
            title('Empirical cdf with K = ' + string(K));
            xlabel('Normalized SNR (dB)');
            ylabel('Outage Probability');
            axis([-40 20 0.0001 1]);
            
           
            
        end
        
        function [] = Q3(obj, n)
            
            N = 1;
            mean = 0;
            std_dev = sqrt(1); 

            x = std_dev.*randn(N,n)+mean;
            y = std_dev.*randn(N,n)+mean;

            z = x+i*y;
            P = (abs(z).^2)/2; %power

            figure('Visible','off');
            cdf = cdfplot(P);
            cdf_x = get(cdf, 'XData');
            cdf_y = get(cdf, 'YData');

            figure;
            semilogy(10*log10(cdf_x), cdf_y)
            grid on
            title('Empirical cdf Q3 for n = ' + string(n));
            xlabel('Normalized SNR (dB)');
            ylabel('Outage Probability');
            axis([-40 20 0.0001 1]);
        
        end
        
        function [] = Q4(obj,N,n,A,amp_dist)
            
            b = 2*pi;
            a = 0;
            M = 1; 
            phase = (b-a)*rand(N,n)+a;
            Ex = zeros(N,n);
            Ey = zeros(N,n);
            
            for i=1:N
                
                Ex(i,:) = cos(phase(i,:));
                Ey(i,:) = sin(phase(i,:));
            end
            
            Ex = A.*Ex;
            Ey = A.*Ey;
        
            for j=1:n
                Ex(:,j) = Ex(:,j)/norm(Ex(:,j));
                Ey(:,j) = Ey(:,j)/norm(Ey(:,j));  %normalize each column to sum 1
            end 
            
            Ex_total =0;
            Ey_total =0;
            
            for k=1:N
                Ex_total = Ex_total + Ex(k,:); %sum each multipath component
                Ey_total = Ey_total + Ey(k,:);
            end
           
                
            E = sqrt((Ex_total.^2)+(Ey_total.^2));
            
          
            figure;
            histogram(E, 'Normalization', 'pdf');
            hold on; 
            x = 0:0.0001:4;
            y = x.*exp((-x.^(2))/2); %ideal rayleigh distribution
            plot(x, y, 'r', 'LineWidth', 2);
            xlabel("x/σ");
            ylabel("f(x)");
            legend({'Emperical pdf', 'Theoretical pdf'})
            title('Multipath signal Rayleigh PDF for n = ' + string(n) + ' N = ' + string(N) + ' Amplitude = ' + string(amp_dist));
            hold off;
            
            P = (E.^2)/2;
            
            figure('Visible','off');
            cdf = cdfplot(P);
            cdf_x = get(cdf, 'XData');
            cdf_y = get(cdf, 'YData');

            figure;
            semilogy(10*log10(cdf_x), cdf_y)
            grid on
            title('Multipath signal Empirical CDF for n = ' + string(n) + ' N = ' + string(N) + ' Amplitude = ' + string(amp_dist));
            xlabel('Normalized SNR (dB)');
            ylabel('Outage Probability');
            axis([-40 20 0.0001 1]);
            
            
         
        end 
            
        function [] = Q1(obj, n)
  
            N = 1;
            delta_x = 0.1;
            mean = 0;
            std_dev = sqrt(1); 
            x_axis = 0:delta_x:5;
            z_sigma = 1; %calculated from prelab

            x = std_dev.*randn(N,n)+mean;
            y = std_dev.*randn(N,n)+mean;

            z = x+i*y;

            figure;
            histogram(abs(z),'Normalization', 'pdf');
            %pdf = hist(abs(z),x_axis)/(n*delta_x);
            hold on;
            pdf1 = raylpdf(x_axis, z_sigma);
            plot(x_axis,pdf1);
            %plot(x_axis,pdf,'r');
            hold off;
            legend('Experimental Rayleigh dist.','Theoretical Rayleigh dist.');
            title('PDF for n = ' + string(n));
            xlabel('z');
            ylabel('f(z)');

        end
        
    end 
end 