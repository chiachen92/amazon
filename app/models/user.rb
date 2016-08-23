class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false},
    format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :products, dependent: :nullify

  has_many :reviews, dependent: :destroy

  def full_name
    "#{first_name}".squeeze(" ").strip.titleize
  end
end
