% Runge-Kutta(Order 4) Algorithm
 % Approximate the solution to the initial-value problem
 % dy/dt=y-t^2+1 ; 0<=t<=2 ; y(0)=0.5;

 f = @(t,y) (y-t^2+1);
 a = input('Enter left end ponit, a:  ');
 b = input('Enter right end point, b:  ');
 n = input('Enter no. of subintervals, n: ');          % n=(b-a)/h
 alpha = input('Enter the initial condition, alpha:  ');

 h = (b-a)/n;
 t = a;
 w = alpha;
 fprintf('  t         w\n');
 fprintf('%5.3f %11.7f\n', t, w);

 for i = 1:n
   k1 = h*f(t,w);
   k2 = h*f(t+h/2.0, w+k1/2.0);
   k3 = h*f(t+h/2.0, w+k2/2.0);
   k4 = h*f(t+h,w+k3);
   w = w+(k1+2.0*(k2+k3)+k4)/6.0;
   t = a+i*h;
   fprintf('%5.3f %11.7f\n', t, w);
   plot(t,w,'b*'); grid on;
   xlabel('t values'); ylabel('w values');
   hold on;
 end
