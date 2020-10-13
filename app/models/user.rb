class User < ApplicationRecord
    has_many :userklass
    has_many :klasses, through: :userklass
end
