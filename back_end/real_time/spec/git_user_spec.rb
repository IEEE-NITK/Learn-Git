require 'rspec'
ENV["ENVIRONMENT"]="TEST"
require 'server.rb'

describe "Git User"

	it "should execute a particular command" do 
		git_user = GitUser.new
		git_user
	end

end