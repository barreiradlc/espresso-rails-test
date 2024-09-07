class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: false
  validates :cnpj, presence: true, uniqueness: true
end
