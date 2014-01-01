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
		r = Repo.where(id: rid).first
		stage = Stage.where(id: @r.status).first
	             puts "got message #{msg}"
		temp = msg.split(":")
		op = temp[0]
		#Create an instance of the git repo !!
		if(op=="cmd")
		out=git_user.execute msg
		puts out.inspect
		puts "HEREE"
		if(Validator.new(stage.id).validate(msg,out))


		else
		end

		out.each_line do |line|
			puts line
			ws.send(line)
		end
		else
		git_user = GitUser.new(temp[1])
		end
	end

	ws.onclose do
		puts "Someone disconnected"
		# git_user.destroy
		soc.delete(ws)
	end

end
