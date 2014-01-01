require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs",  you may want to use :null_session instead.
  protect_from_forgery with: :exception
before_filter :getNotifications



  private
    def makeNotification(targetUsers,notification_string)
        #DO THIS THROUGH A SIDEKIQ WORKER!!!!
        #Extend the target user to be multiple users when pushed to sidekiq!
        #notification should look like this - [<notification string>,<user_id or user_name>]
        notification = [notification_string,current_user.id]
        NotificationMaker.perform_async(targetUsers,notification)
    end

    def sendMessage(targetUsers,message_string)
        #DO THIS THROUGH A SIDEKIQ WORKER!!!
        #Extend the target user to be multiple users when pushed to sidekiq!
        #message should look like this - [<message>,<user_id or user_name>]
        message = [message_string,current_user.id]
        MessageWorker.perform_async(targetUsers,message)
    end

    def getRandomName
        names = ["Sad Python",
                       "Fierce Rare Sledgehammer",
                       "Helpless Backpack",
                       "Stony Grim Roadrunner",
                       "Cheerful Proton",
                       "Morbid Foot",
                       "Frozen Accidentally Wrench",
                       "Longitude Insane",
                       "Ninth Laser",
                       "Appropriate Winter",
                       "Outstanding Monkey",
                       "Northernmost Crayon",
                       "Nocturnal Electrical",
                       "Liquid Morbid Ray",
                       "Nervous Pineapple ",
                       "Streaming Obscure",
                       "Random Name"
                        ]
        a = (0..16).to_a.sample
        @aname = names[a].to_s+"_" + ((1000..9999).to_a.sample).to_s
        puts @aname
        return @aname
    end


    def getNotifications
        if current_user
            f = $Rnotification.LLEN current_user.id
            @notifications = $Rnotification.lrange(current_user.id,0,f)
          else
            @notification = nil
        end
            return @notifications
    end


end
