class UserBodyPart < ApplicationRecord
    belongs_to :card_stack
    belongs_to :body_part

    validates_uniqueness_of :card_stack_id, scope: :body_part_id
end
