class User < ApplicationRecord
    has_secure_password
    has_many :userklass
    has_many :klasses, through: :userklass
end
