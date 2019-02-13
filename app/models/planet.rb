class Planet < ApplicationRecord
    has_many :moons
    has_many :users, through: :moons

    #If 1 user owns all moons of planet then they own the planet
    def has_owner?
      #code
      uniq_users = self.moons.map{|moon| moon.user_id}.uniq
      uniq_users.count == 1 && !uniq_users[0].nil?
    end
end
