class Review < ApplicationRecord
  belongs_to :product

  validates :star_count, presence: true, :inclusion => 1...5

  belongs_to :user

end
