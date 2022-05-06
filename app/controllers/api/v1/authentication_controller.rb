class Api::V1::AuthenticationController < ApplicationController
  def sign_in
    set_token
    model_name = get_model_name_on_sign_in(auth_params[:role])
    @user = model_name.constantize.find_by_dni(auth_params[:dni])
    if @token
      render json: {token: @token}, status: 200
    else
      render json: {error: "Invalid Credentials"}, status: 401
    end
  end
end
