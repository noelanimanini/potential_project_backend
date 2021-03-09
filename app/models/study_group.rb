class StudyGroup < ApplicationRecord
    belongs_to :body_part
    has_many :user_study_groups
    has_many :users, through: :user_study_groups
end
