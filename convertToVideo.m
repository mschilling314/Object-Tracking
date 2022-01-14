function vidFile = convertToVideo(vidTensor, nomen)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
vidFile = VideoWriter(strcat(nomen, '.avi'));
vidFile.FrameRate = 24;
open(vidFile);
[R,C,N,F] = size(vidTensor);

for f = 1:F
    writeVideo(vidFile,vidTensor(:,:,:,f));
end
close(vidFile);
end

