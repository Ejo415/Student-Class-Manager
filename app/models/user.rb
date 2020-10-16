class User < ApplicationRecord
    has_secure_password
    has_many :user_klasses
    has_many :klasses, through: :user_klasses
    validates :email, presence: true
    validates :email, uniqueness: true
    #validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
    scope :instructors, -> { where(instructor: true) }
end
