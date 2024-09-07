class User < ApplicationRecord
  enum role: [:admin, :employee]
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, uniqueness: false
  has_secure_password
end