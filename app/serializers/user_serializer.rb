class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :card_stacks, :study_groups
  # has_many :card_stacks
  # has_many :user_study_groups
  # has_many :study_groups, through: :user_study_groups
  
  def card_stacks
    ActiveModel::SerializableResource.new(object.card_stacks,  each_serializer: CardStackSerializer)
  end 

  def study_groups
    ActiveModel::SerializableResource.new(object.study_groups, 
    each_serializer: StudyGroupSerializer)
  end 
end
