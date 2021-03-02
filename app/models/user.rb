class User < ApplicationRecord
    has_secure_password
    has_many :card_stacks
    has_many :user_study_groups
    has_many :study_groups, through: :user_study_groups
    
    validates :username, presence: true
    validates :username, uniqueness: true
end
