class ApplicationController < ActionController::Base
  include Pundit::Authorization
  skip_forgery_protection
  before_action :authenticate_user!

end
