class User < ActiveRecord::Base
  def self.find_or_create_from_oauth(oauth)
    if user = find_by(uid: oauth.uid)
      user
    else
      create({name: oauth.extra.raw_info.name,
              nickname: oauth.info.nickname,
              uid: oauth.uid,
              token: oauth.credentials.token,
              token_secret: oauth.credentials.secret
        })
    end
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['twitter_key']
      config.consumer_secret = ENV['twitter_secret']
      config.access_token = token
      config.access_token_secret = token_secret
    end
  end
end
