class ApplicationController < ActionController::Base
  include Pundit::Authorization
  skip_forgery_protection
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:landing_page]

  # confused, you have `root "bathrooms#landing_page"` in routes
  # this means all your controllers will have a `landing_page` action
  # should move to BathroomsController or create new controller for landing page
  def landing_page
  end

  def after_sign_in_path_for(resource)
    bathrooms_path
  end

end
