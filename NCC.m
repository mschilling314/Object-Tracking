function N = NCC(cand,template)
%NCC Does normalized cross correlation on cand and template
%   Invariant: cand and template must be the same size.
[R,C,N] = size(cand);
candd = cast(cand, 'double');
tempd = cast(template, 'double');
Iavg = zeros(N,1);
Tavg = zeros(N,1);
for r = 1:R
    for c = 1:C
        for n = 1:N
            Iavg(n) = Iavg(n) + candd(r,c,n);
            Tavg(n) = Tavg(n) + tempd(r,c,n);
        end
    end
end
Iavg = Iavg ./ (R*C);
Tavg = Tavg ./ (R*C);

numer = zeros(N,1);
dl = zeros(N,1);
dr = zeros(N,1);
for r = 1:R
    for c = 1:C
        for n = 1:N
            Ihat = candd(r,c,n) - Iavg(n);
            That = tempd(r,c,n) - Tavg(n);
            numer(n) = numer(n) + Ihat * That;
            dl(n) = dl(n) + Ihat*Ihat;
            dr(n) = dr(n) + That*That;
        end
    end
end

denom = sqrt(dl .* dr);
N = numer ./ denom;
end

