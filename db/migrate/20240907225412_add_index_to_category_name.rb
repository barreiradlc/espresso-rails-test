# frozen_string_literal: true

class AddIndexToCategoryName < ActiveRecord::Migration[5.2]
  def change
    add_index :categories, :name, unique: true
  end

  def down
    remove_index :categories, :name
  end
end
