classdef Class_Methods
    
    methods 
        
        function [] = Q3(obj, n);
            
        N = 1;
        mean = 0;
        std_dev = sqrt(1); 

        x = std_dev.*randn(N,n)+mean;
        y = std_dev.*randn(N,n)+mean;

        z = x+i*y;
        P = (abs(z).^2)/2; %power
        
        cdf = cdfplot(P);
        cdf_x = get(cdf, 'XData');
        cdf_y = get(cdf, 'YData');
        
        figure;
        semilogy(10*log10(cdf_x), cdf_y)
        grid on
        title('Empirical cdf');
        xlabel('Normalized SNR (dB)');
        ylabel('Outage Probability');
        axis([-40 20 0.0001 1]);
        
        end
        
        function [] = Q4(obj,N,n,A)
            
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
            x = 0:0.001:4;
            y = x.*exp((-x.^(2))/2); %ideal rayleigh distribution
            plot(x, y, 'r', 'LineWidth', 2);
            xlabel("x/σ");
            ylabel("f(x)");
            legend({'Emperical pdf', 'Theoretical pdf'})
            hold off;
            
            P = (E.^2)/2;
            
            figure('Visible','off');
            cdf = cdfplot(P);
            cdf_x = get(cdf, 'XData');
            cdf_y = get(cdf, 'YData');

            figure;
            semilogy(10*log10(cdf_x), cdf_y)
            grid on
            title('Empirical cdf');
            xlabel('Normalized SNR (dB)');
            ylabel('Outage Probability');
            axis([-40 20 0.0001 1]);
            
            
         
        end 
            
        function [] = Q1(obj, n)
  
        N = 1;
        delta_x = 0.1;
        mean = 0;
        std_dev = sqrt(1); 
        x_axis = 0:delta_x:10;
        z_sigma = 1; %calculated from prelab

        x = std_dev.*randn(N,n)+mean;
        y = std_dev.*randn(N,n)+mean;

        z = x+i*y;

        pdf = hist(abs(z),x_axis)/(n*delta_x);
        pdf1 = raylpdf(x_axis, z_sigma);

        figure;
        plot(x_axis,pdf1);
        hold on;
        plot(x_axis,pdf,'r');
        hold off;
        legend('Ideal R.V. Rayleigh','R.V Z PDF');
        title('PDF for N = ' + string(n));
        xlabel('z');
        ylabel('f(z)');

        end
        
    end 
end 