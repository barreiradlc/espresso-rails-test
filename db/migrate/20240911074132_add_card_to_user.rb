# frozen_string_literal: true

class AddCardToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :card, null: true, unique: true
    add_reference :cards, :user, null: true, unique: true
  end

  def down
    remove_reference :users, :card
    remove_reference :card, :users
  end
end
