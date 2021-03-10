class CommentSerializer < ActiveModel::Serializer
  attributes :id, :study_group_id, :user_id, :comment
end
