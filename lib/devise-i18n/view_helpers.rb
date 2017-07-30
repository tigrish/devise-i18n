module DeviseI18n
  module ViewHelpers
    def resource_confirmation_token
      resource_token(:confirmation)
    end

    def resource_reset_password_token
      resource_token(:reset_password)
    end

    def resource_unlock_token
      resource_token(:unlock)
    end

    def resource_token(type)
      if Devise::VERSION.start_with?('1.', '2.')
        @resource.public_send("#{type}_token")
      else
        @token
      end
    end
  end
end

