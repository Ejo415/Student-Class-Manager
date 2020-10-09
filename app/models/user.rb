class User < ApplicationRecord
    has_one :schedule
    has_many :classes, through: :schedule
end
