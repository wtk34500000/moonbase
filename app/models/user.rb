class User < ApplicationRecord
    has_many :moons
    has_many :planets, through: :moons
    validates :first_name, :last_name, :display_name, :email, presence: true
    validates :email, uniqueness: true
    has_secure_password

    def get_random_moon
      #code
      unowned_moons = Moon.all.select {|moon| moon.user_id != self.id}
      self.moons << unowned_moons.sample
    end

    def lottery_win?
      #code
      rand(1..100) >= 99
    end
end
