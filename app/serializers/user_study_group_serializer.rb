class UserStudyGroupSerializer < ActiveModel::Serializer
  attributes :user_study_group_id, :username, :user_id

  def user_study_group_id
    object.id
  end 

  def username
    object.user.username
  end 
end
