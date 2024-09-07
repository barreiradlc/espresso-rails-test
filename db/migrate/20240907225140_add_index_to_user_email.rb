# frozen_string_literal: true

class AddIndexToUserEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
  end

  def down
    remove_index :users, :email
  end
end
