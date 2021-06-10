# frozen_string_literal: true

class AddStatusToAnimals < ActiveRecord::Migration[6.1]
  def change
    add_column :animals, :status, :integer
  end
end
