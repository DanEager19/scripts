#!/usr/bin/ruby

user_limit = 1000
first_name_file = "firstnames.txt"
last_name_file = "crops.txt"

first_names = []
first_name_index = 0

File.open(first_name_file, "r").each_line do |first_name| 
    first_name.strip!
    first_names.push(first_name)
    first_name_index += 1
end

last_names = []
last_name_index = 0

File.open(last_name_file, "r").each_line do |last_name| 
    last_name.strip!
    last_names.push(last_name.delete(' '))
    last_name_index += 1
end

names = []

for i in 1..user_limit
    first_name = first_names[rand(first_name_index)]
    last_name = last_names[rand(last_name_index)]

    full_name = "#{first_name} #{last_name}"
    user_name = "#{first_name.downcase}#{last_name.downcase}"
    
    names.push("#{full_name},#{user_name}")
end

names.uniq!

File.open("users.csv", "w+") do |file|
    file.puts(names)
end