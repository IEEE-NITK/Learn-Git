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
            r.name = current_user.id
            r.team_id = t.id
            z = SecureRandom.hex(16)
            r.name = z
            `mkdir #{Dir.pwd}/../repositories/#{z}`
            r.path ="#{Dir.pwd}/../repositories/#{z}"
            r.save

            r = Repo.new
            r.name = u.id
            r.team_id = t.id
            z = SecureRandom.hex(16)
            r.name = z
            `mkdir #{Dir.pwd}/../repositories/#{z}`
            r.path ="#{Dir.pwd}/../repositories/#{z}"
            r.save

            flash[:notice] = "#{u.name} has been invited to join the team. The course will begin when he accepts!"
        else
            flash[:notice] = "The user you want to add doesn't exist. Please ask him to join the site first!"
        end
        redirect_to(controller: "home",action: "index")
    end






end
