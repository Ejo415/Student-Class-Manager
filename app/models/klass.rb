class Klass < ApplicationRecord
    has_many: :userklass
    has_many :users, through: :userklass
    validates :name, presence: true
    validates :instructor, presence: true
    validates :scheduled_time, presence: true
end
