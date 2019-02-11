class User < ApplicationRecord
    has_many :moons
    has_many :planets, through: :moons
    has_secure_password
end
