# frozen_string_literal: true

# == Schema Information
#
# Table name: bathrooms
#
#  id                :bigint           not null, primary key
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
#  user_id           :integer
#
class Bathroom < ApplicationRecord
  paginates_per 10
  geocoded_by :address
  after_validation :geocode

  has_many :favorites, class_name: 'Favorite', foreign_key: 'bathroom_id', dependent: :destroy
  has_many :favorited_by_users, through: :favorites, source: :user
  has_many :reviews
end
