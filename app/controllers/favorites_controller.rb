# frozen_string_literal: true

class FavoritesController < ApplicationController
  before_action :set_favorite, only: %i[show edit update destroy]

  # GET /favorites or /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/1 or /favorites/1.json
  def show; end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end

  # GET /favorites/1/edit
  def edit; end

  # POST /favorites or /favorites.json
  def create
    @bathroom = Bathroom.find(params[:bathroom_id])
    @favorite = current_user.favorites.find_by(bathroom_id: @bathroom.id)

    if @favorite
      redirect_to @bathroom, notice: 'Bathroom is already favorited'
    else
      @favorite = current_user.favorites.build(bathroom_id: @bathroom.id)
      if @favorite.save
        redirect_to @bathroom, notice: 'Bathroom favorited'
      else
        redirect_to @bathroom, alert: 'Failed to favorite bathroom'
      end
    end
  end

  # PATCH/PUT /favorites/1 or /favorites/1.json
  def update
    respond_to do |format|
      if @favorite.update(favorite_params)
        format.html { redirect_to favorite_url(@favorite), notice: 'Favorite was successfully updated.' }
        format.json { render :show, status: :ok, location: @favorite }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1 or /favorites/1.json
  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    if @favorite
      bathroom = @favorite.bathroom
      @favorite.destroy
      redirect_to bathroom, notice: 'Bathroom unfavorited'
    else
      redirect_to bathrooms_path, alert: 'Favorite not found'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def favorite_params
    params.require(:favorite).permit(:user_id, :bathroom_id)
  end
end
