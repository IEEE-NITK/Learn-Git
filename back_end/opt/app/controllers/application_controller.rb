require 'json'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception




  private
    def makeNotification(targetUser,notification)
        #DO THIS THROUGH A SIDEKIQ WORKER!!!!
        #Extend the target user to be multiple users when pushed to sidekiq!
        #notification should look like this - [<notification string>,<user_id or user_name>]
        $Rnotification.LPUSH(targetUser,notification.to_json)
    end

    def sendMessage(targetUser,message)
        #DO THIS THROUGH A SIDEKIQ WORKER!!!
        #Extend the target user to be multiple users when pushed to sidekiq!
        #notification should look like this - [<message>,<user_id or user_name>]
        $Rmessages.LPUSH(targetUser,message.to_json)
    end
end
