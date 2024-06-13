# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :require_authentication

  private

  def require_authentication
    if (user = User.find_by(id: session[:current_user_id]))
      Current.user = user
    else
      redirect_to new_session_path
    end
  end
end
