require 'json'

class Directory

  # attr_accessor :prefix

  def initialize
    # @prefix = prefix
  end

  def get_files_in_directory path , prefix , child
  # child =[]
  # puts "IN #{prefix+path+'/'}"
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
  child
  end

  def get_content prefix,file_path
    #Check if he is autorized to do so
    if File.file?(prefix+file_path)
      puts prefix+file_path
      f = File.open(prefix+file_path,"r+")
    end
  end

  def save_content prefix,file_path,content
    #CHECK THE AUTHORIZATION BASED ON THE URL!!
    puts content
    puts prefix
    puts file_path
    f = File.open(prefix+file_path,"w+")
    f.puts content
    f.close
  end

end
