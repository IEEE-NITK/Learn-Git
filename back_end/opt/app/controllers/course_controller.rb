include RepoHelper
include TeamHelper
class CourseController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@courses = Course.all
  end

  def show
  	#TODO: Check if the course is requires team or not, depending on that checking he has a team or not
    flag=0
    @course = Course.find(params[:id])
    current_user.repos.each do |repository|
      if repository.course_id == @course.id
        flag=1
      end
    end
    puts "-"*100
    puts flag 
    if flag == 0
      redirect_to root_path
    else
      if @course.mcount < 1


      end
      # @notification = cour
    	@stage = Stage.new
      repos = current_user.repos
    	# puts "**"*100
      puts current_user.inspect
      # num1 = repos.find_bu.order.find_index(repos.first.status)
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
  end

  def join 
  	@course = Course.find(params[:id])
  	#Check if course is of team or not
  	if @course.mcount > 1
  		#Handle Team registration

  	else
  		create_team(@course.id)
      puts "redddirectinggg"*20
      redirect_to "/course/#{@course.id}"
  	end
  end

  def merge_it

        file1='/home/karthik/Documents/second_app/app/controllers/mine1'
        file3='/home/karthik/Documents/second_app/app/controllers/orig1'

        `diff3 /home/karthik/Documents/second_app/app/controllers/mine1 /home/karthik/Documents/second_app/app/controllers/mine1 /home/karthik/Documents/second_app/app/controllers/orig1 > diffinput.txt`
            #puts "hello"
            puts Dir.pwd+'/diffinput.txt'
            @diff_str=''
            @file1_str=''
            @file3_str=''

            File.open(Dir.pwd+'/diffinput.txt','r') do |f|
                while line=f.getc
                    if(line.ord==10)
                        line='\n'
                    end
                    @diff_str+=line
                end     
            end

            File.open(file1,'r') do |f|
                while line=f.getc
                    if(line.ord==10)
                        line='\n'
                    end
                    @file1_str+=line
                end
            end

            # file2=file1

            File.open(file3,'r') do |f|
                while line=f.getc
                    if(line.ord==10)
                        line='\n'
                    end
                    @file3_str+=line
                end
            end

            @file1_str = @file1_str.gsub(/[']/,'\\\\\'').html_safe
            @file3_str = @file3_str.gsub(/[']/,'\\\\\'').html_safe

            puts @diff_str
            puts @file1_str
            puts @file3_str
    end








end
