% Parameters
% a = 10.91865;
%astart = 4;
%aend = 5;
%Y0=[1.63,0,-1.63];
%framecnt = 100; %number of frames to render
b = 14;
s = 1/16;
t = -1/6;
tend=500;
winsize=[0;0;1084;738];

F(framecnt) = struct('cdata',[],'colormap',[]);
Y = struct('a',[],'time',[],'data',cell(1));
fig = figure(1);
aspace = linspace(astart,aend,framecnt);

g = @(x) s*x.^3 + t*x;

mins = [10^99 10^99 10^99];
maxs = -[10^99 10^99 10^99];

for j = 1:framecnt
    Y.a = aspace(j);
    f = @(t,Y) [aspace(j)*(Y(2)-g(Y(1))); Y(1)-Y(2)+Y(3); -b*Y(2)];
    fprintf('Rendering frame %d\n',j)
    [T,Data]=ode45(f,[0,tend],Y0);
    Y.time = T;
    Y.data{j} = Data;
    mins(1) = min([mins(1) min(Y.data{j}(:,1))]);
    mins(2) = min([mins(2) min(Y.data{j}(:,2))]);
    mins(3) = min([mins(3) min(Y.data{j}(:,3))]);
    maxs(1) = max([maxs(1) max(Y.data{j}(:,1))]);
    maxs(2) = max([maxs(2) max(Y.data{j}(:,2))]);
    maxs(3) = max([maxs(3) max(Y.data{j}(:,3))]);
end



%xran = [min(Y.data(:,1)) max(Y.data(:,1))];
%yran = [min(Y.data(:,2)) max(Y.data(:,2))];
%zran = [min(Y.data(:,3)) max(Y.data(:,3))];


fig = figure(1);
for j = 1:framecnt
    clf;
    subplot(2,2,1)
    plot3(Y.data{j}(:,1),Y.data{j}(:,2),Y.data{j}(:,3)), grid on
    axis([mins(1) maxs(1) mins(2) maxs(2) mins(3) maxs(3) -Inf Inf]);
    subplot(2,2,2)
    plot(Y.data{j}(:,1),Y.data{j}(:,2)), grid on, xlabel('x'), ylabel('y')
    axis([mins(1) maxs(1) mins(2) maxs(2)])
    subplot(2,2,3)
    plot(Y.data{j}(:,1),Y.data{j}(:,3)), grid on, xlabel('x'), ylabel('z')
    axis([mins(1) maxs(1) mins(3) maxs(3)])
    subplot(2,2,4)
    plot(Y.data{j}(:,2),Y.data{j}(:,3)), grid on, xlabel('y'), ylabel('z')
    axis([mins(2) maxs(2) mins(3) maxs(3)])
    ann = annotation('textbox',[0 0 0.3 0.05]);
    set(ann,'String',sprintf('a = %e',aspace(j)));
    F(j) = getframe(gcf);
end
close(fig);
