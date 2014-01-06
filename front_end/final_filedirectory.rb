require 'json'
 
class Directory
  attr_accessor :counter
  def initialize
    @counter = 1
  end
 
  def get_files_in_directory path , prefix , child
  # child =[]
  #puts "IN #{prefix+path+'/'}"
    # if @counter > 5
    #   return
    # end
    # @counter+=1
    Dir.foreach(prefix+path) do |entry|
      # if path == "src-noconflict"
      #   puts entry
      # end
      # puts @counter
      if entry == "." || entry == ".." || entry[0] == "."
        next
      elsif(File::directory?(prefix+path+'/'+entry))
        childrens = []
        get_files_in_directory entry, prefix+path+"/" , childrens
        # p "*"*100
        # p childrens
        child << {data: entry,children: childrens}
      else
        tmp_hash = {data: entry}
        child << tmp_hash
      end
    end
  #  p child
  #child
  end
end
 
d = Directory.new
tmp = []
d.get_files_in_directory "/home/karthik/Documents/Programming" , "" , tmp
json_obj={"data"=>tmp}
p json_obj.to_json