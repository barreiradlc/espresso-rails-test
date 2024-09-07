# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { admin: 0, employee: 1 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: false
  has_secure_password
end
