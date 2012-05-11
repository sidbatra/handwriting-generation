#!/usr/bin/ruby -W0

require 'rubygems'
require 'net/http'
require 'aws/s3'



url = "/afs/cs.stanford.edu/u/sidbatra/Desktop/list_manager3.html"

file = File.open("addresses.txt","a");


pagedata =  open("#{url}").read

add =  pagedata.scan(/name="address" value="[^"]+/)
#add2 =  pagedata.scan(/name="address2" value="[^"]+/)
city =  pagedata.scan(/name="city" value="[^"]+/)
zip =  pagedata.scan(/name="zip" value="[^"]+/)
names =  pagedata.scan(/name="name" value="[^"]+/)

last = ""

#198 #199 #32
(0..31).each{ |i| 
     
    data =  names[i].split("\"")[3].gsub(" ","_") + "$"  +
            add[i].split("\"")[3].gsub(" ","_") + "$" + 
            city[i].split("\"")[3].gsub(" ","_") + ",_CA_" + zip[i].split("\"")[3]
    
    if ( data != last )
    
        file.write "#{data}"
        file.write "\n"
        last = data;
    end
}

file.close();

puts "#{add.length} #{city.length} #{zip.length} #{names.length}"


