class BathroomsController < ApplicationController
  before_action :set_bathroom, only: %i[ show edit update destroy ]

  # GET /bathrooms or /bathrooms.json
  def index
    if params[:location].present?
      distance = params[:distance].present? ? params[:distance].to_i : 15 # Set default distance to 15 if not provided
      @bathrooms = Bathroom.near(params[:location], distance, order: :distance).page(params[:page])
      @bathrooms = @bathrooms.where(accessible: true) if params[:accessible] == 'true'
      @bathrooms = @bathrooms.where(gender_neutral: true) if params[:gender_neutral] == 'true'
      @bathrooms = @bathrooms.where(family_accessible: true) if params[:family_accessible] == 'true'
      @bathrooms = @bathrooms.where(purchase_required: false) if params[:purchase_required] == 'true'
    else
      @bathrooms = Bathroom.all.page(params[:page])
    end
  end

  # GET /bathrooms/1 or /bathrooms/1.json
  def show
    @bathroom = Bathroom.find(params[:id])
    @favorite = Favorite.find_by(user_id: current_user.id, bathroom_id: @bathroom.id)
  end

  # GET /bathrooms/new
  def new
    @bathroom = Bathroom.new
  end

  # GET /bathrooms/1/edit
  def edit
  end

  # POST /bathrooms or /bathrooms.json
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

  # PATCH/PUT /bathrooms/1 or /bathrooms/1.json
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

  # DELETE /bathrooms/1 or /bathrooms/1.json
  def destroy
    @bathroom.destroy

    respond_to do |format|
      format.html { redirect_to bathrooms_url, notice: "Bathroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bathroom
      @bathroom = Bathroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bathroom_params
      params.require(:bathroom).permit(:address, :hours, :accessible, :gender_neutral, :family_accessible, :purchase_required)
    end
end
