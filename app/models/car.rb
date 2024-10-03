class Car < ApplicationRecord
  belongs_to :owner
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :brand, :model, :year, :fuel, presence: true
end
