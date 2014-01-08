require 'rspec'
require '../directory.rb'

all_test_data = [{data: "folder1",children: [{data: "file1"},{data: "folder2",children: [{data: "file2"}]}]}]

class CreateDirectory

	attr_accessor :base

	def initialize path
		@base = path
		`mkdir #{@base}`
	end	

	def create_dir path_hash , base
		p path_hash
		path_hash.each do |folder|
			if (folder[:children]).kind_of?(Array)
				`mkdir #{@base}#{base}/#{folder[:data]}`
				base += "/"+folder[:data]
				create_dir folder[:children], base
			else
				puts "touch #{@base}#{base}/#{folder[:data]}"
				`touch #{@base}#{base}/#{folder[:data]}`
			end	
		end
	end

	def destroy
		`rm -rf #{@base}`
	end
end

def equal? array1 , array2
	if array1.each do ||
end

tmp1 = CreateDirectory.new "./test1"
tmp1.create_dir all_test_data , ""
dir1 =Directory.new
dir1_hash= dir1.get_files_in_directory "test1" , "./" , [])
tmp1.destroy

tmp2 = CreateDirectory.new "./test2"
tmp1.create_dir dir1 , ""
dir1 =Directory.new
dir1_hash= dir1.get_files_in_directory "test1" , "./" , [])
tmp1.destroy



# describe "For Directories" do 

# 	it "should give all the directories and sub directories with files"
# 		d = Directory.new
# 		d.get_files_in_directory "tmp" , "." , hash
# 		# hash to_be 
# 	end	

# end