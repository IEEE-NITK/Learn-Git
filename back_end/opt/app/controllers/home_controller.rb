require 'securerandom'
class HomeController < ApplicationController
before_filter :getNotifications

    def random_string
    	@str=SecureRandom.uuid()
    end

    def index
    end

    def dashboard
        puts "**"*100
        num1 = current_user.repos.first.order.find_index(current_user.repos.first.status)
        t = current_user.teams.first
        r = Repo.where(team_id: t.id)
        r = r.select{|s| s.id != current_user.repos.first.id}
        r = r.first
        num2 = r.order.find_index(r.status)
        if current_user.repos.first.order.size==8
            @numA = num1
            @numB = num2
        else
            @numA = num2
            @numB = num1
        end
        puts "**#{@numA} ** #{@numB}**"
        puts current_user.inspect
        puts params[:id]
        @course = Course.find(params[:id])
        unless current_user.repos.nil?
            @stage = @course.stages.find_by_step_number(current_user.repos.first.status)
        else
            @stage = @course.stages.first
        end
    end

private



end
