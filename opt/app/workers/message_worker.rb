class MessageWorker
  include Sidekiq::Worker

  def perform(targetUsers,notification)
    targetUsers.each do |user|
        $Rmessages.LPUSH(user,message.to_json)
    end
  end

end
