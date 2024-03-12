# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bathroom_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_favorites_on_bathroom_id  (bathroom_id)
#  index_favorites_on_user_id      (user_id)
#
# Foreign Keys
#
#  bathroom_id  (bathroom_id => bathrooms.id)
#  user_id      (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom
end
