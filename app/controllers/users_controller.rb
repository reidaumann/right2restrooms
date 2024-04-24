class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
  authorize @user
  @favorite_bathrooms = @user.favorite_bathrooms

  rescue Pundit::NotAuthorizedError
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to bathrooms_path
  end
end
