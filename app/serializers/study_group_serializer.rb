class StudyGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :users

  def users
    ActiveModel::SerializableResource.new(object.user_study_groups, each_serializer: UserStudyGroupSerializer)
  end 
end
