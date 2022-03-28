# module Hubspot
#   class Connection
#     class << self
#       def initialize
#         puts "Hubspot::Connection.init"
#       end
#     end
#   end
# end

# module Hubspot
#   class Oauth < Connection
# 		class << self
# 			def callback(code, params={}, options={})
# 				puts "Hubspot::oauth.callback"
# 			end

# 			def authorize_url(params={})
# 				puts "Hubspot::oauth.authorize_url"
# 			end
# 		end
# 	end	
# end

# class ApiProvider
# 	class << self
# 		def oauth(type)
# 			case type
# 			when "hubspot"
# 				Hubspot::Oauth
# 			else
# 				raise StandardError.new "Error Oauth: type has an invalid value (#{type})"
# 			end
# 		end
# 	end
# end

class HomeController < ApplicationController
  def index
    # JWT
    encode = JsonWebToken.encode(user_id: 1)
    decode = JsonWebToken.decode(encode)

    print "token encode: #{encode}"
    print "token decode: #{decode}"

    # Token
    token = TokenGenerationService.generate
    print "token generate: #{token}"

    # Oauth
    ApiProvider.oauth("hubspot").authorize_url()

    # Render
    render json: { api: 'OK' }, status: :ok
  end
end
