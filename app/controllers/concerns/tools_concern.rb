module ToolsConcern
  extend ActiveSupport::Concern

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def get_model_name_on_sign_in role
    case role.downcase
    when 'doctor'
      'Doctor'
    when 'patient'
      'Patient'
    else
      'User'
    end
  end

  def can_to_do_admin_actions
    unless current_user.role. == 'admin'
      render json: {
        error: 'You are not authorized to do this action'
      }, status: 403
    end
  end
end