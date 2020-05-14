# frozen_string_literal: true

class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :title, null: false
      t.string :city, null: false
      t.string :owner, null: false
      t.string :category, null: false
      t.integer :bedrooms, default: 0
      t.string :description

      t.timestamps
    end
  end
end
