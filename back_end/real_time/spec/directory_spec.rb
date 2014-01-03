require 'rspec'
require '../directory.rb'

all_test_data let [{data: "folder1",children: [{data: "file1"},{data: "folder2",children: "file2"}]}]

def create_dir
	for 
end

describe "For Directories" do 

	it "should give all the directories and sub directories with files"
		d = Directory.new
		d.get_files_in_directory "tmp" , "." , hash
		hash to_be 
	end	

end