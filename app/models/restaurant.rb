class Restaurant < ApplicationRecord
  CATEGORY = %w[chinese italian japanese french belgian]

  has_many :reviews, dependant: :destroy

  validates :name, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: CATEGORY }
end
