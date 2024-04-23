# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @favorite_bathrooms = @user.favorite_bathrooms
  end
end
