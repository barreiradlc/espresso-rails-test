# frozen_string_literal: true

class Card < ApplicationRecord
  validates :last_digits, presence: true
  belongs_to :user
end
