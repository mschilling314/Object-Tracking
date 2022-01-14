function pico = grabTiny(pici, tL, sizzle)
%GRABTINY grabs a tiny portion of pici
%   Output pico is a tiny portion of pici, of size sizzle with its start
%   (top left corner) starting at tL.  Very similar to drawBox...but not
%   really because you don't need explicit loops thanks to MATLAB.  Used to
%   grab candidates
leftBound = tL(1);
rightBound = leftBound + sizzle(1);
topBound = tL(2);
bottomBound = topBound + sizzle(2);

%fprintf("(%d:%d,%d:%d)\n", leftBound, rightBound, topBound, bottomBound);

pico = pici(leftBound:rightBound, topBound:bottomBound, :);
% default sizzle is [40,35], default topLeft is [30,55]
end

