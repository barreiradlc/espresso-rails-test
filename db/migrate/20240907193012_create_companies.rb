# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cnpj

      t.timestamps
    end
  end

  def down
    drop_table :companies do |t|
      t.string :name
      t.string :cnpj

      t.timestamps
    end
  end
end
