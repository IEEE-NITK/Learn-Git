require 'securerandom'
class TeamController < ApplicationController

    def new

    end

    def create
        u = User.where(email: params[:email])
        if !u.first.nil?
            u = u.first
            makeNotification(u.id,"You have been invited by #{current_user.name} to join the team #{params[:tname]} for Git course!")
            t = Team.new
            t.name = params[:tname]
            t.status = 0.00
            #Add orderA and orderB here
            t.save
            #TODO: ON accepting of inv and not when the user is actually invited

            r = Repo.new
            z = SecureRandom.hex(16)
            r.name = z
            r.user_id = current_user.id
            r.team_id = t.id
            r.course_id = 2
            r.name = z
            r.status = 1

            `mkdir #{Dir.pwd}/../repositories/#{z}`
            r.path ="../repositories/#{z}"
            r.order = [1,2,3,4,8,10,11,12]
            r.save

            z = SecureRandom.hex(16)
            r = Repo.new
            r.name = z
            r.user_id = u.id
            r.team_id = t.id
            r.course_id = 2
            r.name = z
            r.status = 1

            `mkdir #{Dir.pwd}/../repositories/#{z}`
            r.path ="../repositories/#{z}"
            r.order = [1,2,3,5,6,7,8,9]
            r.save

            flash[:notice] = "#{u.name} has been invited to join the team. The course will begin when he accepts!"
        else
            flash[:notice] = "The user you want to add doesn't exist. Please ask him to join the site first!"
        end
        redirect_to(controller: "home",action: "index")
    end






end
