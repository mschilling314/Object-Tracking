function C = CC(cand,template)
%CC Does Cross Correlation between two images.
%   Invariant: cand and template must be the same size.
[Rows,Cols,N] = size(cand);
C = zeros(N,1);

candd = cast(cand, 'double');
tempd = cast(template, 'double');

for r = 1:Rows
    for c = 1:Cols
        for n = 1:N
            %fprintf("Cand: %d, tempL %d\n", candd(r,c,n), tempd(r,c,n));
            C(n) = C(n) + candd(r,c,n) * tempd(r,c,n);
        end
    end
end
end

