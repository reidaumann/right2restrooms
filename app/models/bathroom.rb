# == Schema Information
#
# Table name: bathrooms
#
#  id                :integer          not null, primary key
#  accessible        :boolean
#  address           :string
#  family_accessible :boolean
#  gender_neutral    :boolean
#  hours             :string
#  latitude          :float
#  longitude         :float
#  purchase_required :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer          not null
#
class Bathroom < ApplicationRecord
end
