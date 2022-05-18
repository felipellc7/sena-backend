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

  def format_pagination_response result, params
    {
      from: params[:from].to_i,
      size: params[:size].to_i,
      total: result.total_count,
      pages: result.total_pages,
      records: result,
    }
  end

  def filtering_params(params)
    JSON.parse params
  end

  def can_to_do_admin_actions
    unless current_user.role. == 'admin'
      render json: {
        error: 'You are not authorized to do this action'
      }, status: 403
    end
  end
end