class StudyGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :date,:description, :users

  has_one :body_part
  def users
    ActiveModelSerializers::SerializableResource.new(object.user_study_groups, each_serializer: UserStudyGroupSerializer)
  end 
end
