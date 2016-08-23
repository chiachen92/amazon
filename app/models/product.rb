class Product < ApplicationRecord

# validates :title, presence: true, :uniqueness => { case_sensitive: false }

validates :price, presence: true, :numericality => { :greater_than => 0.0, :less_than => 1000.0 }

# validates :description, presence: true, length: { minimum: 10 }

before_validation :cap_title

after_initialize :set_defaults

has_many :reviews, dependent: :destroy

belongs_to :category

belongs_to :user



def self.search(keyword)
  (where(["title ILIKE ?", "%#{keyword}%"]).order(title: :desc)+where(["description ILIKE ?", "%#{keyword}%"]).order(description: :asc)).uniq
end

private

def set_defaults
  self.price ||= 1
end

def cap_title
  self.title.capitalize! if title
end

end
