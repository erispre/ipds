framecnt = 250;
as = 4;
ae = 14;
astep = 1;
Y0=[1.63,0,-1.63];

runs = (ae - as)/astep;

for k=0:runs-1
    astart = as + k*astep;
    aend = astart + astep;
    
    chuamovie
    
    save(sprintf('data-constaxes/a-%4.2e-%4.2e-frames-%d.mat',astart,aend,framecnt),'F','Y');
    clear F Y T
end
clear
