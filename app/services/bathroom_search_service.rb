class BathroomSearchService
  def initialize(params)
    @params = params
  end

  def search
    if @params[:location].present?
      distance = @params[:distance].present? ? @params[:distance].to_i : 10
      bathrooms = Bathroom.near(@params[:location], distance, order: :distance)
    else
      bathrooms = Bathroom.all
    end

    apply_accessibility_filters(bathrooms)
  end

  private

  def apply_accessibility_filters(bathrooms)
    if @params[:accessibility_options].present?
      accessibility_options = @params[:accessibility_options]
      bathrooms = bathrooms.where(accessible: true) if accessibility_options.include?('accessible')
      bathrooms = bathrooms.where(gender_neutral: true) if accessibility_options.include?('gender_neutral')
      bathrooms = bathrooms.where(family_accessible: true) if accessibility_options.include?('family_accessible')
      bathrooms = bathrooms.where(purchase_required: false) if accessibility_options.include?('purchase_required')
    end

    bathrooms
  end
end
