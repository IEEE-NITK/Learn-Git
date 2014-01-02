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
        puts current_user.inspect
        puts params[:id]
        @course = Course.find(params[:id])
        # unless current_user.repos.nil?
        #     @stage = @course.stages.find_by_id(current_user.repos.first.status)
        # else
            @stage = @course.stages.first
        # end
    end

private



end
