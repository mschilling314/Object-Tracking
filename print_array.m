function throwaway = print_array(arr)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[R,C] = size(arr);
throwaway = 69;
fprintf("\n");

for r = 1:R
    for c = 1:C
        fprintf("%d\t", arr(r,c));
    end
    fprintf("\n");
end
fprintf("\n");
end

