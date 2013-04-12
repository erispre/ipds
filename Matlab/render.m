framecnt = 250;
as = 8;
ae = 14;
astep = 1;
Y0=[0.01,0,-0.01];

runs = (ae - as)/astep;

for k=0:runs-1
    astart = as + k*astep;
    aend = astart + astep;
    
    chuamovie
    
    save(sprintf('data-origin/a-%4.2e-%4.2e-frames-%d.mat',astart,aend,framecnt),'F','Y');
    clear F Y T
end
clear
