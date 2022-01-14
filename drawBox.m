function pic = drawBox(img, topLeft, sizzle)
%DRAWBOX draws a red box at the point topLeft of size sizzle on img
%   Look mate, idk, it just draws the fucken box ok?
pic = img;
%sizzle(1) gives width, sizzle(2) height
x = topLeft(1);
y = topLeft(2);

%draw top line
for n = 1:sizzle(1)
    pic(x,y,1) = 255;
    pic(x,y,2) = 0;
    pic(x,y,3) = 0;
    x = x + 1;
end
%draw right line
for n = 1:sizzle(2)
    pic(x,y,1) = 255;
    pic(x,y,2) = 0;
    pic(x,y,3) = 0;
    y = y + 1;
end

%draw bottom line
for n = 1:sizzle(1)
    pic(x,y,1) = 255;
    pic(x,y,2) = 0;
    pic(x,y,3) = 0;
    x = x - 1;
end

%draw left line
for n = 1:sizzle(2)
    pic(x,y,1) = 255;
    pic(x,y,2) = 0;
    pic(x,y,3) = 0;
    y = y - 1;
end
% default sizzle is [40,35], default topLeft is [30,55]
%sizzle mah shizzle or whatever
end

