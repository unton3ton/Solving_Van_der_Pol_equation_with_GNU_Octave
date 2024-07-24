 mu = 5;
 f1 = @(x,y,z) [mu*(1-z^2)*y-z];
 f2 = @(x,y,z) [y];

 x0 = 0;
 y0 = 0; % z'(0) = y(0) = 0
 z0 = 2; % z(0) = 1
 n = 500; % число шагов
 h = 0.1; % размер шага

 fid = fopen('data.txt','wt');  % Note the 'wt' for writing in text mode

  for i = 1:n
   k1 = h*f1(x0,y0,z0);
   L1 = h*f2(x0,y0,z0);

   k2 = h*f1(x0 + h/2, y0 + k1/2, z0 + L1/2);
   L2 = h*f2(x0 + h/2, y0 + k1/2, z0 + L1/2);

   k3 = h*f1(x0 + h/2, y0 + k2/2, z0 + L2/2);
   L3 = h*f2(x0 + h/2, y0 + k2/2, z0 + L2/2);

   k4 = h*f1(x0 + h, y0 + k3, z0 + L3);
   L4 = h*f2(x0 + h, y0 + k3, z0 + L3);

   y = y0 + (k1 + 2*k2 + 2*k3 + k4)/6;
   z = z0 + (L1 + 2*L2 + 2*L3 + L4)/6;

   x = x0 + h;
   fprintf('%5.3f %11.7f\n', x, y);

   fprintf(fid, "x = %5.3f y = %11.7f y' = %11.7f\n", x, y, z);  % The format string is applied to each element of a

   x0 = x;
   y0 = y;
   z0 = z;

   plot(x0,y0,'b*','Linewidth',1.1,'Markersize',3);
   plot(x0, z0, 'ro','Linewidth',1.1,'Markersize',2);
   grid on;
   xlabel('x'); ylabel("y, y'");
   title('Runge-Kutta for Balthasar van der Pol');

   legend("y' = y'(x)", "y = y(x)");
   hold on;
 end

 fclose(fid);
