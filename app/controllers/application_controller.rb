class ApplicationController < ActionController::Base
  include Pundit::Authorization
  skip_forgery_protection

  before_action :authenticate_user!, except: :index

  private
  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
  end
end
