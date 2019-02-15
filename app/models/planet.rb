class Planet < ApplicationRecord
    has_many :moons
    has_many :users, through: :moons

    #If 1 user owns all moons of planet then they own the planet
    def has_owner?
      #code
      uniq_users = self.moons.map{|moon| moon.user_id}.uniq
      uniq_users.count == 1 && !uniq_users[0].nil?
    end

    #return a owner instance
    def get_owner
      if self.has_owner?
        User.find(self.moons.first.user_id)
      end
    end


end
