

% For the images I've been using, i runs from 1 to 12, j runs from 1 to 15 

function [xcoord, ycoord] = characterIndices(i,j,a,xoffset, yoffset)

offset = 21; 

xBoundaries = round(1:size(a,1)/15:size(a,1));
yBoundaries = round(1:size(a,2)/12:size(a,2));
if (xBoundaries(length(xBoundaries)) ~= size(a,1))
  xBoundaries = [xBoundaries size(a,1)];
end;
if (yBoundaries(length(yBoundaries)) ~= size(a,2))
  yBoundaries = [yBoundaries size(a,2)];
end;

xcoord = ((xBoundaries(j) + offset):(xBoundaries(j+1)-offset)) + xoffset;
ycoord = ((yBoundaries(i) + offset):(yBoundaries(i+1)-offset)) + yoffset;


