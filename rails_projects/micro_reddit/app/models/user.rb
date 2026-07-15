class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :username,
            presence: true,
            uniqueness: true,
            length: { minimum: 3, maximum: 20 },
            allow_blank: true
  
  validates :email,
            presence: true,
            uniqueness: true

  validates :password,
            presence: true,
            length: { minimum: 6 },
            allow_blank: true
end
