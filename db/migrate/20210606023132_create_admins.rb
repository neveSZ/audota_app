# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins, &:timestamps
  end
end
