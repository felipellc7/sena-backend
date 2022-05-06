class ApplicationController < ActionController::API
  include ToolsConcern
  attr_reader :current_user
  
  protected
  def authenticate_user_by_token
    @current_user ||= Authentication::TokenValidator.new(bearer_token).execute
    unless current_user && current_user.active #&& (bearer_token == @current_user.access_token)
      render json: {error: 'Access Denied'}, status: 401
    end
  end
  def set_token
    @token ||= Authentication::Login.new(
      auth_params[:dni],
      auth_params[:password],
      get_model_name_on_sign_in(auth_params[:role])
    ).execute
  end

  private
  def auth_params
    params.require(:user).permit(:dni, :password, :role)
  end
end
