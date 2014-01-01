class NotificationMaker
  include Sidekiq::Worker

  def perform(targetUsers,notification)
    targetUsers.each do |user|
        $Rnotification.LPUSH(user,notification.to_json)
    end
  end

end
