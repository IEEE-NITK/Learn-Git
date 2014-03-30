class NotificationMaker
  include Sidekiq::Worker

  def perform(user,notification)
        $Rnotification.LPUSH(user,notification.to_json)
  end

end
