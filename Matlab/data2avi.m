framecnt = 250;
as = 4;
ae = 14;
astep = 1;

runs = (ae - as)/astep;

mov(runs*framecnt) = struct('cdata', [], 'colormap', []);

for k=0:runs-1
    astart = as + k*astep;
    aend = astart + astep;
    
    load(sprintf('data-origin/a-%4.2e-%4.2e-frames-%d.mat',astart,aend,framecnt));
    mov(framecnt*k+1:framecnt*(k+1)) = F;
end
