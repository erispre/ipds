as = 4;
ae = 14;
astep = 1;
framecnt = 250;

runs = (ae - as)/astep;

M(runs*framecnt)=struct('cdata',[],'colormap',[]);

for k=0:runs-1
    astart = as + k*astep;
    aend = astart+astep;
    
    load(sprintf('data-constaxes/a-%4.2e-%4.2e-frames-%d.mat',astart,aend,framecnt));
    
    M(1+k*framecnt:(k+1)*framecnt)=F;
end

movie(figure(),M,5,20)