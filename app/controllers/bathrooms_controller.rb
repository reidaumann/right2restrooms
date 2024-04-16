class BathroomsController < ApplicationController
  before_action :set_bathroom, only: %i[ show edit update destroy ]

  def index
    @bathrooms = BathroomSearchService.new(params).search.page(params[:page])
  end
  
  def show
    @bathroom = Bathroom.find(params[:id])
    @favorite = current_user.favorites.find_by(bathroom_id: @bathroom.id)
  end

  def new
    @bathroom = Bathroom.new
  end

  def edit
  end

  def create
    @bathroom = Bathroom.new(bathroom_params)

    respond_to do |format|
      if @bathroom.save
        format.html { redirect_to bathroom_url(@bathroom), notice: "Bathroom was successfully created." }
        format.json { render :show, status: :created, location: @bathroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bathroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @bathroom.update(bathroom_params)
        format.html { redirect_to bathroom_url(@bathroom), notice: "Bathroom was successfully updated." }
        format.json { render :show, status: :ok, location: @bathroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bathroom.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bathroom.destroy

    respond_to do |format|
      format.html { redirect_to bathrooms_url, notice: "Bathroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_bathroom
      @bathroom = Bathroom.find(params[:id])
    end

    def bathroom_params
      params.require(:bathroom).permit(:address, :hours, :accessible, :gender_neutral, :family_accessible, :purchase_required)
    end
end
