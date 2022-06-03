class ApplicationController < ActionController::Base
  protected
  def authorize_admin
    redirect_to root_path, alert: "Permissions denied" unless
      user_signed_in? && current_user.admin?
  end
end
