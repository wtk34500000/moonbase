class Planet < ApplicationRecord
    has_many :moons
    has_many :users, through: :moons
end
