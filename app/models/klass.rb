class Klass < ApplicationRecord
    belongs_to :schedule
    has_many :users, through: :schedule
end
