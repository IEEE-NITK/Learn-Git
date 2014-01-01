require 'eventmachine'
require 'em-websocket'
require "redis"
require_relative './class'

soc = []


EM::WebSocket.start(host: '127.0.0.1',port: 4000) do |ws|

	# t= Stage.new
	git_user = nil
	ws.onopen do
		soc << ws
		puts "#{soc.length} clients are connected"
		d = Directory.new
		tmp = []
		d.get_files_in_directory ".." , "" , tmp
		hash = {opt: "dir",content: tmp}
		puts hash
		ws.send(hash.to_json)
	end

	ws.onmessage do |msg|
		# msg 
		git_user = GitUser.new()
		#Create an instance of the git repo !! 
		puts "got message #{msg}"
		out=git_user.execute msg
		puts out.inspect
		puts "HEREE"
		out.each_line do |line|
			puts line
			ws.send(line)
		end
	end

	ws.onclose do
		puts "Someone disconnected" 
		# git_user.destroy
		soc.delete(ws)
	end

end