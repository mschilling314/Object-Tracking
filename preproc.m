function vid = preproc()
%PREPROC Takes filestring, returns tensor of video
%   vid is a 4th rank tensor, it has RGB, but the 4th field is actually the
%   time.  
vid = zeros(96,128,3,500);

for x = 0:4
    for y = 0:9
        for z = 0:9
            if (x == 0 && y == 0 && z == 0)
                % do nothing, 0000.jpg doesn't exist :/
            else
                ind = x * 100 + y * 10 + z;
                stri = strcat('image_girl/0',num2str(x),num2str(y),num2str(z),'.jpg');
                %fprintf(strcat(stri,'\n'));
                vid(:,:,:,ind) = imread(stri);
            end
        end
    end
end
vid(:,:,:,500) = imread("image_girl/0500.jpg");
vid = cast(vid,'uint8');
end

