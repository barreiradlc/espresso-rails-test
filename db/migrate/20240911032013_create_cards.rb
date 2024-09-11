# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :last_digits

      t.timestamps
    end
  end

  def down
    drop_table :cards do |t|
      t.string :last_digits

      t.timestamps
    end
  end
end
