function vido = track(vidi, tLinit, sizzle, eval, swing, temprate)
%TRACK Tracks an object in vidi, writing a boxed object to vido.
%   tLinit is the initial location of the object.  Sizzle is the size of
%   the object, eval is 1 for CC, 2 for SSD, 3 for NCC, and anything else
%   if you want to get an error.  Swing is how big you want the search
%   window to be, keep in mind though that there are F*(2*swing)^2
%   loops, which means that this will impact runtime by O(n^2).  Lastly,
%   temprate allows you to change how often the template updates, as in it
%   will be temprate frames until the template is updated again, which may
%   or may not be useful.
vido = vidi;  %at first, input and output videos are the same
[R,C,N,F] = size(vidi); % get the video size

R = R - sizzle(1); % get the furthest right a candidate can be
C = C - sizzle(2); % get the furthest down a dandidate can be

template = grabTiny(vidi(:,:,:,1), tLinit, sizzle); % grab the initial template
vido(:,:,:,1) = drawBox(vidi(:,:,:,1), tLinit, sizzle); % draw the initial box

tL = tLinit; % initialize a position variable


for f = 2:F
    %print_array(tL);
    switch eval
        case 1
            evalF = @CC; 
            param = Inf;    % because we want to minimize for CC
        case 2
            evalF = @SSD;
            param = 0;      % because we want to maximize for SSD
        case 3
            evalF = @NCC;
            param = 0;      % because we want to maximize for NCC
        otherwise
            error("LMAO you fool you chose an invalid eval function");
    end
    rlow = tL(1) - swing;   %this does range restriction for search
    clow = tL(2) - swing;   %same as last
    rhigh = tL(1) + swing;  %same as last
    chigh = tL(2) + swing;  %same as last
    if rlow < 1
        rlow = 1;
    end
    if clow < 1
        clow = 1;
    end
    if rhigh > R
        rhigh = R;  % bounds check
    end
    if chigh > C
        chigh = C;  % bounds check
    end
    % iterate over the search range
    for r = rlow:rhigh
        for c = clow:chigh
            %fprintf("%d \n", param);
            cand = grabTiny(vidi(:,:,:,f), [r,c], sizzle);  % get a candidate
            temp = sum(evalF(cand, template))/N;    %evaluate the candidate
            if (eval == 1 && temp < param)
                param = temp;   % set the param because candidate is best
                tL = [r,c]; % set position because candidate is best
            end
            if (eval ~=1 && temp > param)
                param = temp;   % set param bc candidate is best
                tL = [r,c]; %set position bc candidate is best
            end
        end
    end
    if mod(f,temprate) == 0   % every updateable frames, update the template
        template = grabTiny(vidi(:,:,:,f), tL, sizzle);
    end
    vido(:,:,:,f) = drawBox(vidi(:,:,:,f), tL, sizzle); %draw the box on this frame
end
end

