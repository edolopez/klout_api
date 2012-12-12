require 'klout_api'
require 'json'

module KloutAPI
  # Represents an identity
  class Identity
    class << self
      def find_by_twitter_id(twitter_id)
        response = KloutAPI.get "/identity.json/tw/#{twitter_id}", :query => {key: KloutAPI.api_key}
        Hashie::Mash.new(response)
      end
      
      def find_by_screen_name(screen_name)
        response = KloutAPI.get "/identity.json/twitter", :query => {key: KloutAPI.api_key, screenName: screen_name}
        Hashie::Mash.new(response)
      end
      
      def find_by_klout_id(klout_id)
        response = KloutAPI.get "/identity.json/klout/#{klout_id}/tw", :query => {key: KloutAPI.api_key}
        Hashie::Mash.new(response)
      end
    end
  end
end
