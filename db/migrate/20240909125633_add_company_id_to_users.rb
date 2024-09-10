# frozen_string_literal: true

class AddCompanyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :company, foreign_key: true
  end

  def down
    remove_reference :users, :company
  end
end
