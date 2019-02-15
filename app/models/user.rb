class User < ApplicationRecord
    has_many :moons
    has_many :planets, through: :moons
    validates :first_name, :last_name, :display_name, :email, presence: true
    validates :email, uniqueness: true
    has_secure_password

    #return a random moon
    def get_random_moon
      #code
      unowned_moons = Moon.all.select {|moon| moon.user_id != self.id}
      self.moons << unowned_moons.sample
    end

    # return true if the condition is true(1% chance)
    def lottery_win?
      #code
      rand(1..100) >= 99
    end

    #return the number count of the user's planet owned
    def get_planet_count
        Planet.all.select do |planet|
            if !planet.get_owner.nil?
              planet.get_owner.id == self.id
            end
        end.count
    end

    #return full name of the user
    def to_s
      "#{first_name} #{last_name}"
    end
end
