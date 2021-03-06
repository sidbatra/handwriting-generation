
%figure(1);

addresses = loadAddresses();

    
[dict,nextToUse] = buildDictionary;

for i=['A':'Z' '0':'9'], nextToUse{i} = 1; end;  % make deterministic here for repeatibility


%figure(2);
%for fileCtr=1:10, 
  %string = randomAddress(1);
  
  for fileCtr=1:size(addresses,2), 
  
     
  string = cell2mat(addresses(fileCtr))
  %string = randomAddress(1)
  
  img = ones(500,1500)*255;
  
  characterStep = 3 * 3; 
  spaceStep = 10 * 3;
  lineheight = 25 * 3; 
  currentMargin = 50;
  
  origCursorY = 40;
  cursorY = origCursorY;
  cursorX = currentMargin; 
  linecount = 1;
  
  for i=1:length(string),
    if (string(i) == ' ' || string(i) == '_' || string(i) == '-'),
      cursorX = cursorX + spaceStep; continue; 
    elseif (string(i) == '$'),
      cursorX = currentMargin;
      cursorY = cursorY + lineheight; 
      linecount = linecount + 1; 
   
      if (linecount == 21), 
        currentMargin = currentMargin + 400 * 3;
        cursorX = currentMargin;
        cursorY = 40;
        linecount = 1;
      end;
      continue;
    end;
  
    thisCharacter = dict{string(i)}{nextToUse{string(i)}};
    nextToUse{string(i)} = nextToUse{string(i)} + 1; 
    if (nextToUse{string(i)}==6), nextToUse{string(i)}=1; end;
  
    height = size(thisCharacter.img,1);
    width = size(thisCharacter.img,2);
  
    % size(thisCharacter.img) size(img(cursorY-height+1:cursorY, cursorX:cursorX+width-1)) 
  
    firstRow = max( cursorY , cursorY-round(0.7*height)+1);
    
    img(firstRow:firstRow+height-1, cursorX:cursorX+width-1) = thisCharacter.img;
  
    cursorX = cursorX+width+ characterStep;
  end; 
  
  % imagesc(img);

  % Convert to blue ink 
  invImg = 255-img;
  [ix,jx] = find(invImg ~= 0);
  invImg = invImg(1:max(ix)+origCursorY,1:max(jx)+currentMargin);

  %tmp = zeros(size(img,1),size(img,2),3); 
  tmp = zeros(size(invImg,1),size(invImg,2),3); 
  tmp(:,:,1) = round(invImg*0.95); 
  tmp(:,:,2) = round(invImg*0.85); 
  tmp(:,:,3) = round(invImg*0.5); 
  tmp=255-tmp;
  %imagesc(tmp/255)
 
  filename = strcat('./addresses/', sprintf('%03d',fileCtr), '.png'); 
  imwrite(tmp/255, filename, 'png');
end;



 
  
  
  
  
  
  
  
