class Owner < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :favorites

  validates :nickname, presence: true
end
