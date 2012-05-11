
% Given an array representing evaluations of a function x, 
% finds the "low" values. After rescaling all values to 
% between 0 and 1, all values less than threshold are considered
% a min.  However, whenever a minimum value is found, values
% adjacent to it (to the size of +- suppressWidth) are also
% suppressed and no longer considered candidates.
%
% This implementation is pretty inefficient.
%
function peaks = findlowVals(x, suppressWidth, threshold)

x = x - min(x);
x = x/max(x);

peaks = [];

while (min(x) < threshold)
  idx = find(x == min(x));
  idx = idx(1);

  peaks = [peaks idx];   

  for i=idx-suppressWidth:idx+suppressWidth,
    x(i) = 1;
  end;
end;

peaks = sort(peaks);

