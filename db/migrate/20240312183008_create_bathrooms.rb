# frozen_string_literal: true

class CreateBathrooms < ActiveRecord::Migration[7.0]
  def change
    create_table :bathrooms do |t|
      t.string :address
      t.string :hours
      t.boolean :accessible
      t.boolean :gender_neutral
      t.boolean :family_accessible
      t.boolean :purchase_required

      t.timestamps
    end
  end
end
