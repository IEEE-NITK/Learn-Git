include RepoHelper
include TeamHelper
class CourseController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@courses = Course.all
  end

  def show
  	#TODO: Check if the course is requires team or not, depending on that checking he has a team or not
  	@course = Course.find(params[:id])
    if @course.mcount < 1


    end
    # @notification = cour
  	@stage = Stage.new
    repos = current_user.repos
  	# puts "**"*100
    puts current_user.inspect
    num1 = repos.first.order.find_index(repos.first.status)
    t = repos.find_by_course_id(@course.id).team
    # t = current_user.teams.first
    # r = Repo.where(team_id: t.id)
    # r = r.select{|s| s.id != repos.first.id}
    # r = r.first
    # num2 = r.order.find_index(r.status)
    # if repos.first.order.size==8
    #     @numA = num1
    #     @numB = num2
    # else
    #     @numA = num2
    #     @numB = num1
    # end
    # puts "**#{@numA} ** #{@numB}**"
    # puts current_user.inspect
    # puts params[:id]
    unless repos.nil?
      @stage = @course.stages.find_by_step_number(repos.first.status)
    else
      @stage = @course.stages.first
    end
  end

  def join 
  	@course = Course.find(params[:id])
  	#Check if course is of team or not
  	if @course.mcount > 1
  		#Handle Team registration 
  	else
  		create_team(@course.id)
      redirect_to "/course/#{@course.id}"
  	end
  end


end
