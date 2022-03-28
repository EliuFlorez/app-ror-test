module CRM
  class ApiProvider
    class << self
      def oauth(type)
        case type
        when "hubspot"
          Hubspot::Oauth
        else
          raise StandardError.new "Error Oauth: type has an invalid value (#{type})"
        end
      end
    end
  end
end