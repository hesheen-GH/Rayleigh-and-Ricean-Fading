classdef Class_Methods
    
    methods 
        
        function [] = Q4(obj,N)
            
            b = 2*pi;
            delta_x = 0.1;
            a = 0;
            M = 1; 
            n = 100000;
            mp_signal = (b-a)*rand(N,n)+a;
            Ex = 0;
            Ey = 0;
            
            
            for i=1:N
                
                Ex = Ex + cos(mp_signal(i,:));
                Ey = Ey + sin(mp_signal(i,:));
            
            end
            
            E = sqrt((Ex.^2)+(Ey.^2));
            %E = E./norm(E);
         
            histogram(E,'Normalization','probability');
            
        end 
            
%             
%             for i = 1:N
%                 
%                 phi = (b-a)*rand(M,n)+a;
%                 
%                 for k = 1:length(phi)
%               
%                     mp_real = cos(phi(k));
%                     mp_img = sin(phi(k));
% 
%                     Ex = mp_real/norm(mp_real);
%                     Ey = mp_img/norm(mp_real);
% 
%                     mp_signal(i,k) = sqrt((Ex.^2)+(Ey.^2));
%                                         
%                 end
%                 
%                 mp_signal(i,:) = mp_signal(i,:)./norm(mp_signal(i,:));
%                 
%             end  
%             
%             mp_signal_sum = 0;
%             
%             for j = 1:N
%                 
%                 mp_signal_sum = mp_signal_sum + mp_signal(j,:);
%                 
%             end 
        
      
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