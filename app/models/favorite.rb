# == Schema Information
#
# Table name: favorites
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  bathroom_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_favorites_on_bathroom_id  (bathroom_id)
#  index_favorites_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (bathroom_id => bathrooms.id)
#  fk_rails_...  (user_id => users.id)
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :bathroom
end
