class UserBodyPart < ApplicationRecord
    belongs_to :card_stack
    belongs_to :body_part
end
