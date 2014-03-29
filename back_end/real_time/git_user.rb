class GitUser

	attr_accessor :id,:path

	def initialize(id)
		#check the status and load the question!!
		@id = id
		@path = Repo.find(id).path
		@username = "Foo"
		@email = "bar@baz.com"
	end

	def execute cmd
		# if cmd ~= 'git clone *'
		if !cmd.empty? && cmd.length>=3 && cmd[0,3].match("git")
			cmd = cmd[3,cmd.length]
			if cmd.include? "config"
				save_config(cmd)
			end
			if(cmd.include?"clone")
				run_clone(cmd)
			else
				cmd = cmd + " --quiet" if cmd.include? "init"
				puts "git --git-dir #{Dir.pwd}/#{@path}/.git --work-tree=#{Dir.pwd}/#{@path}/ #{cmd}\n"
				stdin, stdout, stderr = Open3.popen3('git-shell')
				stdin.puts "git --git-dir #{Dir.pwd}/#{@path}/.git --work-tree=#{Dir.pwd}/#{@path}/ #{cmd}\n"
				stdin.close
				flag = true
				if cmd.include? "init"
					execute "git config --local user.name \"#{@username}\" "
					execute "git config --local user.email \"#{@email}\" "
				end
				stdout
			end
		end

		# stdout.each do |line|
		# 	puts line
		# 	flag = false
		# end
		# unless stderr.nil?
		# stderr.each do |line|
		# 	puts line if flag
		# end
		#Replace !!!
	end

	def save_config cmd
		if cmd.include? "user.name"
			@username = cmd.split("\"")[1]
		elsif cmd.include? "user.email"
			@email = cmd.split("\"")[1]
		end
	end

	def run_config

	end


	def destroy
		#Commit with a dummy

		#Push it to Github

		#Remove from the db

	end

	def run_clone(cmd)
		puts "git clone #{Dir.pwd}/../courses/#{@id} #{Dir.pwd}/#{@path}"
		stdin, stdout, stderr = Open3.popen3('git-shell')
		stdin.puts "git clone #{Dir.pwd}/../courses/#{@id}  #{Dir.pwd}/#{@path}"
		stdin.close
		stdout
	end

	# def get_content


	private

end

# g = GitUser.new
# g.execute
