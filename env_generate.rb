#!/usr/bin/ruby -W0

require 'ftools'


dir = "./addresses"

#lpr -P tweety -o PageSize=Env10 -Upper pdfs/002.pdf

files = Dir.new("#{dir}").entries

index = 1;

    files.each do |f|
        if f.scan(".png").length != 0 && f.length > 2
            puts f
            File.copy( "#{dir}/#{f}" , "./latex/to.png" )
            Dir.chdir( "./latex" );
            File.delete( "env.pdf" );
            puts `make`
            pdf = f.gsub(".png",".pdf");
            File.copy( "env.pdf" , "../env_pdfs/#{pdf}");
            Dir.chdir( "../" );

            #if index > 3
            #    break;
            #end

            index = index + 1;
        end
    end



