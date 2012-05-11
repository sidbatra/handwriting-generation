#!/usr/bin/ruby -W0

require 'ftools'


# env_pdfs are handwritten envelopes which will be printed for *EVEN* entries
# prenv_pdfs are printed envelopes which will be printed for *ODD* entries
# letter_pdfs are the inside contents to be printed for everyone


#task = "env"
#task = "prenv"
task = "letter"

if task == "env"
    base = 2;
    rem = 0;
    dir = "./env_pdfs"
elsif task == "prenv"
    base = 2;
    rem = 1;
    dir = "./prenv_pdfs"
elsif task == "letter"
    base = 1;
    rem = 0;
    dir = "./letter_pdfs"
else
    puts "undefined task"
    exit;
end



files = Dir.new("#{dir}").entries

index = 1;

    files.each do |f|
        if f.scan(".pdf").length != 0 && f.length > 2 && index % base == rem
            name = "#{dir}/" + f

            #replace " by ` when ready in line below
            puts "lpr -P tweety -o PageSize=Env10 -Upper #{name}"
        end
       
        #TESTING
        #if ( index > 10 )
        #        break;
        #end
        #
        index = index + 1;
    end



