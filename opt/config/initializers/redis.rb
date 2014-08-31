r = Redis.new(:host => "0.0.0.0", :port => 6379) #CHANGE THIS DURING PRODUCTION

$Rmsg = Redis::Namespace.new(:messages,redis: r)
$Rnotification = Redis::Namespace.new(:notifications, redis: r)
