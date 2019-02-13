class User < ApplicationRecord
    has_many :moons
    has_many :planets, through: :moons
    validates :first_name, :last_name, :display_name, :email, presence: true
    validates :email, uniqueness: true
    has_secure_password

end
