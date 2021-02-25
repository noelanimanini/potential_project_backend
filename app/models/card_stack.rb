class CardStack < ApplicationRecord
    belongs_to :user
    has_many :user_body_parts
    has_many :body_parts, through: :user_body_parts
end
