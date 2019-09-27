class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name home_club membership_status partner])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name home_club membership_status partner])
  end

  def admin_required
    unless current_user && current_user.admin?
      redirect_to root_path
      flash[:alert] = 'You are not an authorized administrator!'
    end
  end

  def render_not_found(status = :not_found)
    render plain: status.to_s.titleize.to_s, status: status
  end

  def send_flash_alert(message)
    flash[:alert] = message
  end

  def get_current_year_events(events)
    results = []
    events.each do |e|
      if e.created_at.year == Date.today.year
        results << e
      end
    end
      return results
  end
end
