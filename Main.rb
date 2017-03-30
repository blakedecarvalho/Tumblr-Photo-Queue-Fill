
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

require "tumblr_client"

Tumblr.configure do |config|
  config.consumer_key = ""
  config.consumer_secret = ""
  config.oauth_token = ""
  config.oauth_token_secret = ""
end

client = Tumblr::Client.new
Count = 44
PHOTO = IO.binread("~/Photonumber.rb").to_i
NEWPHOTO = PHOTO.to_i
begin
  while Count <= 296
    client.photo("YOURTUMBLRUSERNAME.tumblr.com", :data => ["F:\\PHOTOFOLDER\\#{PHOTO}.jpg"], :state => "queue",  :tags => "art")
    puts Count
    Count += 1
    NEWPHOTO += 1
    PHOTO = NEWPHOTO.to_i
    File.open("~/Photonumber.rb", 'w+') do |f2|
      f2.puts "#{NEWPHOTO}"
    end
    sleep rand(10..15)
  end
  rescue
    client.photo("YOURTUMBLRUSERNAME.tumblr.com", :data => ["F:\\PHOTOFOLDER\\#{PHOTO}.gif"], :state => "queue",  :tags => "art")
    puts Count
    Count += 1
    NEWPHOTO += 1
    PHOTO = NEWPHOTO.to_i
    File.open("~/Photonumber.rb", 'w+') do |f2|
      f2.puts "#{NEWPHOTO}"
    end
    sleep rand(10..15)
  retry
end
