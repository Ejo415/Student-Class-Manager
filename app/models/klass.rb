class Klass < ApplicationRecord
    has_many :user_klasses
    has_many :users, through: :user_klasses
    validates :name, presence: true
    validates :instructor, presence: true
    validates :scheduled_time, presence: true
end
