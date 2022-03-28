module CRM
  module Hubspot
    class Oauth < Connection
      class << self
        def callback(code, params = {}, options = {})
          puts "Hubspot::oauth.callback"
        end

        def authorize_url(params = {})
          puts "Hubspot::oauth.authorize_url"
        end
      end
    end
  end
end