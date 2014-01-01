class GitUser

	attr_accessor :id

	def initialize
		#check the status and load the question!!
	end

	def execute cmd
		# if cmd ~= 'git clone *'
		cmd = cmd[3,cmd.length]
		stdin, stdout, stderr = Open3.popen3('git-shell')
		stdin.puts "git --git-dir #{Dir.pwd}/../../.git --work-tree=#{Dir.pwd}/../../ #{cmd}\n"
		stdin.close
		flag = true
		stdout
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


	def destroy
		#Commit with a dummy

		#Push it to Github

		#Remove from the db

	end


private

end

# g = GitUser.new
# g.execute
