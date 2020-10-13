class Klass < ApplicationRecord
    belongs_to :schedule
    has_many :users, through: :schedule
    validates :name, presence: true
    validates :instructor, presence: true
    validates :scheduled_time, presence: true
end
