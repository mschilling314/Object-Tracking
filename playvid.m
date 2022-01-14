function lol = playvid(vid,frameRate)
%PLAYVID Plays vid at frameRate
%   No detail needed.
[~,~,~,N] = size(vid);
lol = 69;

fh = figure();
fh.WindowState = "maximized";

for n = 1:N
    imshow(vid(:,:,:,n));
    fh.WindowState = "maximized";
    hold on;
    pause(1/frameRate);
end
end

