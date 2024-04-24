class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to bathroom_path(@review.bathroom_id), notice: "Review added!"
    else
      redirect_to bathroom_path(@review.bathroom_id), alert: "Unable to add review to bathroom"
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    authorize @review
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  rescue Pundit::NotAuthorizedError
    respond_to do |format|
      format.html { redirect_to bathroom_url(@review.bathroom), alert: "You are not authorized to perform this action." }
      format.json { render json: { error: "You are not authorized to perform this action." }, status: :unauthorized }
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    authorize @review
    @review.destroy
    redirect_to bathroom_path(@review.bathroom_id), notice: "Review deleted!"
  rescue Pundit::NotAuthorizedError
    respond_to do |format|
      format.html { redirect_to bathroom_url(@review.bathroom), alert: "You are not authorized to perform this action." }
      format.json { render json: { error: "You are not authorized to perform this action." }, status: :unauthorized }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:user_id, :bathroom_id, :body)
  end
end
