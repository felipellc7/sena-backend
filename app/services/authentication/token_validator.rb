require 'json_web_tokens/decode'
include ToolsConcern

module Authentication
  class TokenValidator
    attr_reader :token, :user

    def initialize(token)
      @token = token
    end

    def execute
      return false unless decoded_token
      # return false if expired_token?
      find_and_return_user
    end

    private

    # def expired_token?
    #   decoded_token['expiration'] < 24.hours.ago.to_i
    # end

    def find_and_return_user
      model_name = get_model_name_on_sign_in decoded_token['role']
      @user ||= model_name.constantize.find_by_dni(decoded_token['dni'])
    end

    def decoded_token
      @decoded_token ||= JsonWebTokens::Decode.new(token).execute
    end
  end
end