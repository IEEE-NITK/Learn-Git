class CourseController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@courses = Course.all
  end

  def show
  	#TODO: Check if the course is requires team or not, depending on that checking he has a team or not
  	@course = Course.find(params[:course_id])
  	# @stage = Stage.new
  	# puts "**"*100
   #      puts current_user.inspect
   #      num1 = current_user.repos.first.order.find_index(current_user.repos.first.status)
   #      t = current_user.teams.first
   #      r = Repo.where(team_id: t.id)
   #      r = r.select{|s| s.id != current_user.repos.first.id}
   #      r = r.first
   #      num2 = r.order.find_index(r.status)
   #      if current_user.repos.first.order.size==8
   #          @numA = num1
   #          @numB = num2
   #      else
   #          @numA = num2
   #          @numB = num1
   #      end
   #      # puts "**#{@numA} ** #{@numB}**"
   #      puts current_user.inspect
   #      puts params[:id]
   #      @course = Course.find(params[:id])
   #      unless current_user.repos.nil?
   #          @stage = @course.stages.find_by_step_number(current_user.repos.first.status)
   #      else
   #          @stage = @course.stages.first
   #      end
  end

  def join 
  	@course = Course.find(params[:course])
  	#Check if course is of team or not 
  	if @course.mcount > 1 
  		#Handle Team registration 
  	else
  		
  	end
  end


end
