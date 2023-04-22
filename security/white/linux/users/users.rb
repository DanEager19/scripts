#!/usr/bin/ruby

user_file = "users.txt"

File.open(user_file, "r").each_line do |user| 
    user.strip!
    if user.end_with?('*')  
        puts `useradd -m -G sudo #{user.chop}`
    else
        puts `useradd -m #{user}`
    end
end