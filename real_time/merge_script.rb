require 'json'
require 'open3'
file1='/home/karthik/Documents/nitk-rug-site/Gemfile'
file3='/home/karthik/Documents/d2a/Gemfile'


%x(diff3 /home/karthik/Documents/nitk-rug-site/Gemfile /home/karthik/Documents/nitk-rug-site/Gemfile /home/karthik/Documents/d2a/Gemfile > diffinput.txt)
#puts "hello"
puts Dir.pwd+'/diffinput.txt'
diff_str=''
file1=''
file3=''

File.open(Dir.pwd+'/diffinput.txt','r') do |f|
	while line=f.gets
		diff_str+=line
	end
end

File.open(file1,'r') do |f|
	while line=f.gets
		file1_str+=line
	end
end

file2=file1

File.open(file3,'r') do |f|
	while line=f.gets
		file3_str+=line
	end
end

