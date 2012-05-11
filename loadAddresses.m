
function addresses = loadAddresses()

file_stream = fopen('addresses.txt','r');
%file_stream = fopen('trial.txt','r');


index = 1;

while(true)
    line = fgetl(file_stream);
    
    addresses(index) = {upper(strcat(line,'$$'))};
    
    if ~ischar(line)
        break;
    end
    
    index = index + 1;
    
end

end