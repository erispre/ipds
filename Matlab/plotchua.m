% Parameters
% a = 10.91865;
a = 7;
b = 14;
s = 1/16;
t = -1/6;
tend=500;

fprintf('Equilibria: origin, and +/- %e\n',sqrt(-t/s))

g = @(x) s*x.^3 + t*x;
f = @(t,Y) [a*(Y(2)-g(Y(1))); Y(1)-Y(2)+Y(3); -b*Y(2)];

% Solve the DE
Y0=[1.63,0,-1.63];
[T,Y]=ode45(f,[0,tend],Y0);
[T2,Y2]=ode45(f,[0,tend],-Y0);
% Calculate the x-nullcline
xmin = min(Y(:,1));
xmax = max(Y(:,1));
x = linspace(xmin,xmax);
xcline = g(x);
% Graphical output
figure(1)
clf
subplot(2,2,1), plot3(Y(:,1),Y(:,2),Y(:,3)), grid on
subplot(2,2,2), plot(Y(:,1),Y(:,2)), hold on, grid on, xlabel('x'), ylabel('y'), plot(x,xcline,'r-')
subplot(2,2,3), plot(Y(:,1),Y(:,3)), grid on, xlabel('x'), ylabel('z')
subplot(2,2,4), plot(Y(:,2),Y(:,3)), grid on, xlabel('y'), ylabel('z')
figure(2)
clf
subplot(2,2,1), plot3(Y2(:,1),Y2(:,2),Y2(:,3)), grid on
subplot(2,2,2), plot(Y2(:,1),Y2(:,2)), hold on, grid on, xlabel('x'), ylabel('y'), plot(-x,-xcline,'r-')
subplot(2,2,3), plot(Y2(:,1),Y2(:,3)), grid on, xlabel('x'), ylabel('z')
subplot(2,2,4), plot(Y2(:,2),Y2(:,3)), grid on, xlabel('y'), ylabel('z')
