class BathroomsController < ApplicationController
  before_action :set_bathroom, only: %i[ show edit update destroy ]

  # GET /bathrooms 
  def index
    if params[:location].present?
      distance = params[:distance].present? ? params[:distance].to_i : 10 # Set default distance to 10 if not provided
      @bathrooms = Bathroom.near(params[:location], distance, order: :distance).page(params[:page])
      
      if params[:accessibility_options].present?
        accessibility_options = params[:accessibility_options]
        @bathrooms = @bathrooms.where(accessible: true) if accessibility_options.include?('accessible')
        @bathrooms = @bathrooms.where(gender_neutral: true) if accessibility_options.include?('gender_neutral')
        @bathrooms = @bathrooms.where(family_accessible: true) if accessibility_options.include?('family_accessible')
        @bathrooms = @bathrooms.where(purchase_required: false) if accessibility_options.include?('purchase_required')
      end
      
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
