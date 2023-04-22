#!/usr/bin/ruby
File.open("/etc/passwd", "r").each_line do |user| 
    if user =~ /(.*)sh$/ then 
        `echo #{user.split(':')[0]}:Password1! | chpasswd` 
    end 
end