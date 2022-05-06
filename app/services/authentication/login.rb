require 'json_web_tokens/encode'

module Authentication
  class Login
    attr_reader :user, :password, :role

    def initialize(dni, password, role)
      @user = dni
      @password = password
      @role = role
    end

    def execute
      return false unless valid_user?
      generate_json_web_token
    end

    private

    def user
      user ||= @role.constantize.find_by_dni(@user)
    end

    def valid_user?
      return false unless user
      user.authenticate(password)
    end

    def generate_json_web_token
      JsonWebTokens::Encode.new(user_params).execute
    end

    def user_params
      {
        first_name: user.first_name,
        last_name: user.last_name,
        full_name: user.full_name,
        dni: user.dni,
        email: user.email,
        role: user.role,
      }
    end
  end
end