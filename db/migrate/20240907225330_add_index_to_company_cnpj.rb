# frozen_string_literal: true

class AddIndexToCompanyCnpj < ActiveRecord::Migration[5.2]
  def change
    add_index :companies, :cnpj, unique: true
  end

  def down
    remove_index :companies, :cnpj
  end
end
