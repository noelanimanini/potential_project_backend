class StudyGroup < ApplicationRecord
    has_many :user_study_groups
    has_many :users, through: :user_study_groups
end
