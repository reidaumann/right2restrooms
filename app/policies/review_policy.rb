class ReviewPolicy < ApplicationPolicy
  def initialize(user, review)
    @user = user
    @review = review
  end

  def update?
    @user.present? && @review.user_id == @user.id
  end

  def destroy?
    update?
  end
end
