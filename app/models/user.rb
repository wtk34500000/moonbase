class User < ApplicationRecord
    has_many :moons
    has_many :planets, through: :moons
    validates :email, uniqueness: true
    has_secure_password

end
