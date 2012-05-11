
function y = extractCharacter(x)

threshold = 215;   % Pixels lighter than this are considered white 

if (x < threshold),
  y = x;
else
  y = min(x + (x-threshold)*10, 255);
end; 


