function D = SSD(cand,template)
%SSD Does sum of squared difference on cand and template
%   Invariant: cand and template must be the same size.
[Rows,Cols,N] = size(cand);
D = zeros(N,1);

candd = cast(cand, 'double');
tempd = cast(template, 'double');

for r = 1:Rows
    for c = 1:Cols
        for n = 1:N
            D(n) = D(n) + (candd(r,c,n) - tempd(r,c,n))*(candd(r,c,n) - tempd(r,c,n));
        end
    end
end
end

