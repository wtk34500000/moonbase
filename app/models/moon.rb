class Moon < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :planet, optional: true
end
