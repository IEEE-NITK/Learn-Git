# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#Make the initial Git course
Course.delete_all
Stage.delete_all
c = Course.new
c.name = "Git Basics"
c.objective  = "Teach the basics of git in an interactive way."
c.problem = "Git"
c.prerequisites = "None"
c.rating = 10.00
c.references = "http://www.git-tower.com/blog/git-cheat-sheet-detail/,http://git-scm.com/"
c.useful_materials = "http://git-scm.com/book"
c.image_url = "git.jpg"
c.mcount = 1
c.id=1
c.save

#Add stages to the Git course
#Stage 1
s = Stage.new
s.course_id=1
s.step_number=1
s.objective="To configure git with the shell."
s.pbody="One can specify Git configuration settings with the git config command. Set up your name and e-mail address."
s.hints='$ git config --local user.name "John Doe"
$ git config --local user.email johndoe@example.com'
s.references="http://git-scm.com/book/en/Customizing-Git-Git-Configuration"
# s.validation = []
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras=""
s.save

#Stage 2
s = Stage.new
s.course_id=1
s.step_number=2
s.objective="To initialise a git repository."
s.pbody="In order to do anything in Git, you have to have a Git repository. This is where Git stores the data for the snapshots you are saving. Initialize a new one from an existing directory, such as a new project or a project new to source control."
s.hints="$ git init"
s.references="http://git-scm.com/docs/git-init"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras="-q\n
--quiet\n
Only print error and warning messages, all other output will be suppressed.\n

--bare\n
Create a bare repository. If GIT_DIR environment is not set, it is set to the current working directory."
s.save

#Stage 3
s = Stage.new
s.course_id=1
s.step_number=3
s.objective="To create a new file with some contents."
s.pbody=""
s.hints=""
s.references=""
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras=""
s.save

#Stage 4
s = Stage.new
s.course_id=1
s.step_number=4
s.objective="To check the status of the repository"
s.pbody="In order to see what the status of your staging area is compared to the code in your working directory, you can run the git status command."
s.hints="$ git status"
s.references="http://git-scm.com/docs/git-status"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras="-s\n
--short\n
Give the output in the short-format.\n

-b\n
--branch\n
Show the branch and tracking info even in short-format."
s.save

#Stage 5
s = Stage.new
s.course_id=1
s.step_number=5
s.objective="To add a file to be tracked by Git."
s.pbody='In Git, you have to add file contents to your staging area before you can commit them. If the file is new, you can run git add to initially add the file to your staging area, but even if the file is already "tracked" - ie, it was in your last commit - you still need to call git add to add new modifications to your staging area.'
s.hints="$ git add <filename>\n
$ git add ."
s.references="http://git-scm.com/docs/git-add"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras=""
s.save

#Stage 6
s = Stage.new
s.course_id=1
s.step_number=6
s.objective="To check the status of the repository"
s.pbody="In order to see what the status of your staging area is compared to the code in your working directory, you can run the git status command."
s.hints="$ git status"
s.references="http://git-scm.com/docs/git-status"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras="-s\n
--short\n
Give the output in the short-format.\n

-b\n
--branch\n
Show the branch and tracking info even in short-format."
s.save

#Stage 7
s = Stage.new
s.course_id=1
s.step_number=7
s.objective="To commit the current stage of the tracked repository."
s.pbody="Now that you have staged the content you want to snapshot with the git add command, you run git commit to actually record the snapshot. Git records your name and email address(done in stage 1) with every commit you make."
s.hints='$ git commit -m "<commit message>"'
s.references="http://git-scm.com/docs/git-commit"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras='$ git commit -am "<commit message>" : To directly commit with all tracked files.'
s.save

#Stage 8
s = Stage.new
s.course_id=1
s.step_number=8
s.objective="To check the status of the repository"
s.pbody="In order to see what the status of your staging area is compared to the code in your working directory, you can run the git status command."
s.hints="$ git status"
s.references="http://git-scm.com/docs/git-status"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras="-s\n
--short\n
Give the output in the short-format.\n

-b\n
--branch\n
Show the branch and tracking info even in short-format."
s.save

#Stage 9
s = Stage.new
s.course_id=1
s.step_number=9
s.objective="To get a list of previous commits and its specifications."
s.pbody="The git log command gives a record of the recent commits on the current git initialised repository."
s.hints="$ git log"
s.references="http://git-scm.com/docs/git-log"
s.validation = ["cmd_r",/git/]
s.useful_links=""
s.extras=""
s.save


########################

#Course 2
c=Course.new
c.name="First Step Using Git"
c.image_url = "git1.jpg"
c.objective="To develop a quiz game using Git, on being paired with another developer thus inducing team work."
c.problem="Git"
c.prerequisites="Git Basics Course"
c.rating=10.0
c.references= "JSON reference: www.w3schools.com/json/ ; GIT Cheatsheet : http://www.git-tower.com/blog/git-cheat-sheet-detail/"
c.useful_materials=""
c.mcount=2
c.id=2
c.save

#Stage 1(both A and B)
#A = 1,2,3,4,8,10,11,12
#B = 1,2,3,5,6,7,8,9
s=Stage.new
s.course_id=c.id
s.step_number=1
s.objective="To clone an existing repository."
s.pbody="Clones a repository into a newly created directory, creates remote-tracking branches for each branch in the cloned repository, and creates and checks out an initial branch that is forked from the cloned repository's currently active branch."
s.hints="$ git clone <repo name>"
s.references="http://git-scm.com/docs/git-clone"
s.useful_links=""
s.extras=""
s.validation= ["cmd_r",/git clone https:\/\/github.com\/nitkrug\/quiz.git/]
s.save

#Stage 2(both A and B)
s=Stage.new
s.course_id=c.id
s.step_number=2
s.objective="To set reference for any repository(called as remotes)."
s.pbody="Manage the set of repositories ('remotes') whose branches you track.Adds a remote named <name> for the repository at <url>."
s.hints="$ git remote add <remote_name> <repository_link>"
s.references="http://git-scm.com/docs/git-remote"
s.useful_links=""
s.extras="rename\n
Rename the remote named <old> to <new>.\n
remove\n
rm\n
Remove the remote named <name>. All remote-tracking branches and configuration settings for the remote are removed. "
s.validation=["cmd_r",/git remote add/]
s.save

#Stage 3(both A and B)
s=Stage.new
s.course_id=c.id
s.step_number=3
s.objective="To edit a JSON file by adding questions."
s.pbody="JSON file has to be modified and questions have to be added."
s.hints='{"name":"answer","alt":"question"}'
s.references="www.w3schools.com/json/"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git commit -/]
s.save

#Stage 4(developer A)
s=Stage.new
s.course_id=c.id
s.step_number=4
s.objective="To learn pulling and merging code using git(done by developer A)."
s.pbody='<p>Assume the following history exists and the current branch is
&quot;<tt>master</tt>&quot;:
</p>
</div>
<div >
  <div>
    <pre><tt>	  A---B---C master on origin
	 /
    D---E---F---G master
	^
	origin/master in your repository
</tt></pre>
  </div>
</div>
<div>
  <p>Then &quot;<tt>git pull</tt>&quot; will fetch and replay the changes from the remote
<tt>master</tt> branch since it diverged from the local <tt>master</tt> (i.e., <tt>E</tt>)
until its current commit (<tt>C</tt>) on top of <tt>master</tt> and record the
result in a new commit along with the names of the two parent commits
and a log message from the user describing the changes.
</p>
</div>'
s.hints="$ git pull <remote> <branch>,$ git merge <branch1> <branch2>"
s.references="http://git-scm.com/docs/git-pull,http://git-scm.com/docs/git-merge"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git pull B master/]
s.save

#Stage 5(developer B)
s=Stage.new
s.course_id=c.id
s.step_number=5
s.objective="To make a mistake, and commit the same by accident(done by B)."
s.pbody="The developer B has to cross this stage"
s.hints=""
s.references=
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git commit -/]
s.save

#Stage 6(developer B)
s=Stage.new
s.course_id=c.id
s.step_number=6
s.objective="To rollback to the previous commit."
s.pbody="git reset is used to record some new commits to reverse the effect of some earlier commits (often only a faulty one)."
s.hints="$ git reset HEAD"
s.references="http://git-scm.com/docs/git-reset"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git reset HEAD/]
s.save

#Stage 7(developer B)
s=Stage.new
s.course_id=c.id
s.step_number=7
s.objective="To learn pulling and merging code using git(done by developer B)."
s.pbody='<p>Assume the following history exists and the current branch is
&quot;<tt>master</tt>&quot;:
</p>
</div>
<div >
  <div>
    <pre><tt>	  A---B---C master on origin
	 /
    D---E---F---G master
	^
	origin/master in your repository
</tt></pre>
  </div>
</div>
<div>
  <p>Then &quot;<tt>git pull</tt>&quot; will fetch and replay the changes from the remote
<tt>master</tt> branch since it diverged from the local <tt>master</tt> (i.e., <tt>E</tt>)
until its current commit (<tt>C</tt>) on top of <tt>master</tt> and record the
result in a new commit along with the names of the two parent commits
and a log message from the user describing the changes.
</p>
</div>'
s.hints="$ git pull <remote> <branch>,$ git merge <branch1> <branch2>"
s.references="http://git-scm.com/docs/git-pull,http://git-scm.com/docs/git-merge"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git pull A master/]
s.save

#Stage 8(both A and B)
s=Stage.new
s.course_id=c.id
s.step_number=8
s.objective="Adding more questions to the JSON file."
s.pbody="Both developers edit and add more questions."
s.hints=""
s.references=""
s.useful_links="www.w3schools.com/json/"
s.extras=""
s.validation = ["cmd_r",/git commit -/]
s.save

#Stage 9(developer B)
s=Stage.new
s.course_id=c.id
s.step_number=9
s.objective="To learn pulling and merging code using git(done by developer B)."
s.pbody='<p>Assume the following history exists and the current branch is
&quot;<tt>master</tt>&quot;:
</p>
</div>
<div >
  <div>
    <pre><tt>	  A---B---C master on origin
	 /
    D---E---F---G master
	^
	origin/master in your repository
</tt></pre>
  </div>
</div>
<div>
  <p>Then &quot;<tt>git pull</tt>&quot; will fetch and replay the changes from the remote
<tt>master</tt> branch since it diverged from the local <tt>master</tt> (i.e., <tt>E</tt>)
until its current commit (<tt>C</tt>) on top of <tt>master</tt> and record the
result in a new commit along with the names of the two parent commits
and a log message from the user describing the changes.
</p>
</div>'
s.hints="$ git pull <remote> <branch>,$ git merge <branch1> <branch2>"
s.references="http://git-scm.com/docs/git-pull,http://git-scm.com/docs/git-merge"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git pull A master/]
s.save

#Stage 10(developer A)
s=Stage.new
s.course_id=c.id
s.step_number=10
s.objective="To make a mistake, and commit the same by accident.(done by A)"
s.pbody="The developer A has to cross this stage"
s.hints=""
s.references=""
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git commit -/]
s.save

#Stage 11(developer A)
s=Stage.new
s.course_id=c.id
s.step_number=11
s.objective="To rollback to the previous commit."
s.pbody="git reset is used to record some new commits to reverse the effect of some earlier commits (often only a faulty one)."
s.hints="$ git reset HEAD"
s.references="http://git-scm.com/docs/git-reset.html"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git reset HEAD/]
s.save

#Stage 12(developer A)
s=Stage.new
s.course_id=c.id
s.step_number=12
s.objective="To learn pulling and merging code using git(done by developer A)."
s.pbody='<p>Assume the following history exists and the current branch is
&quot;<tt>master</tt>&quot;:
</p>
</div>
<div >
  <div>
    <pre><tt>	  A---B---C master on origin
	 /
    D---E---F---G master
	^
	origin/master in your repository
</tt></pre>
  </div>
</div>
<div>
  <p>Then &quot;<tt>git pull</tt>&quot; will fetch and replay the changes from the remote
<tt>master</tt> branch since it diverged from the local <tt>master</tt> (i.e., <tt>E</tt>)
until its current commit (<tt>C</tt>) on top of <tt>master</tt> and record the
result in a new commit along with the names of the two parent commits
and a log message from the user describing the changes.
</p>
</div>'
s.hints="$ git pull <remote> <branch>,$ git merge <branch1> <branch2>"
s.references="http://git-scm.com/docs/git-pull,http://git-scm.com/docs/git-merge"
s.useful_links=""
s.extras=""
s.validation = ["cmd_r",/git pull B master/]
s.save
