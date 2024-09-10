# frozen_string_literal: true

class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: false
  validates :cnpj, presence: true, uniqueness: true

  has_many :users, dependent: :destroy
end
