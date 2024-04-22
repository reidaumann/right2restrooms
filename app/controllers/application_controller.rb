class ApplicationController < ActionController::Base
  include Pundit::Authorization
  skip_forgery_protection
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:landing_page]

  def landing_page
  end

  def after_sign_in_path_for(resource)
    bathrooms_path
  end

end
