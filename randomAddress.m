


function str = randomAddress(numAddresses)


firstnames = textread('firstnames.txt', '%s');
lastnames = textread('lastnames.txt', '%s');
streetnames = textread('streetnames.txt', '%s');
citynames = textread('citynames.txt', '%s');

str = '';
for i=1:numAddresses,
  str = strcat(str, firstnames{floor(rand*length(firstnames))+1});
  str = strcat(str, '_');
  str = strcat(str, lastnames{floor(rand*length(lastnames))+1});
  str = strcat(str, '$');

  if (rand < 0.20)
    str = strcat(str, sprintf('%d', floor(rand*9)+1));
  elseif (rand < 0.60)
    str = strcat(str, sprintf('%d', floor(rand*99)+1));
  else
    str = strcat(str, sprintf('%d', floor(rand*999)+1));
  end;
  str = strcat(str, '_');
  str = strcat(str, streetnames{floor(rand*length(streetnames))+1});
  str = strcat(str, '$');

  str = strcat(str, citynames{floor(rand*length(citynames))+1});
  str = strcat(str, '_');
  str = strcat(str, sprintf('%5d', 10000 + floor(rand*90000)));
  str = strcat(str, '$$');
end; 



