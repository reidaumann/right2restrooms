class BathroomPolicy < ApplicationPolicy
  def initialize(user, bathroom)
    @user = user
    @bathroom = bathroom
  end

  def update?
    @user.present? && @bathroom.user_id == @user.id
  end

  def destroy?
    update?
  end
end
