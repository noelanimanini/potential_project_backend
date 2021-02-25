class BodyPart < ApplicationRecord
    has_many :user_body_parts
    has_many :card_stacks, through: :user_body_parts
end
