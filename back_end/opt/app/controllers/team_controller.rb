class TeamController < ApplicationController

    def new

    end

    def create
        u = User.where(email: params[:email]).first
        if u.first
            makeNotification(u.id,"You have been invited by #{current_user.name} to join the team #{params[:tname]} for Git course!")
            flash[:notice] = "#{u.name} has been invited to join the team. The course will begin when he accepts!"
        else
            flash[:notice] = "The user you want to add doesn't exist. Please ask him to join the site first!"
        end
        redirect_to(controller: "home",action: "index")
    end






end
