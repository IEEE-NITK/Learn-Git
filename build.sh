if [ ! -d "repositories" ]; then
	mkdir repositories # This will have all the repo's of the user
fi
if [ -f "$HOME/git-shell-commands/git" ]; then
	echo "Great Everything for terminal is setup!"
else
	if [ -d "~/git-shell-commands" ]; then
		echo "Great! git-shell-commands directory exists"
	fi
	git_path=`which git`
	if [ $? -eq 0 ]; then
		echo $git_path
		`cp $git_path ~/git-shell-commands`
	else
		echo "Cannot find git"
		return -1;
	fi
	echo "Done"
fi
cd opt
bundle
bundle exec rake db:migrate
bundle exec rake db:seed
cd ../real_time
bundle
echo "You have to run the following
* Redis server (redis-server command)
* Rails server in opt folder by doing 'bundle exec rails s'
* Running terminal server in realt_time folder by doing 'bundle exec ruby server.rb'
"
