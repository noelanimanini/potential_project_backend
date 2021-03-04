class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :card_stacks
  # has_many :card_stacks
  has_many :user_study_groups
  has_many :study_groups, through: :user_study_groups
  
  def card_stacks
    ActiveModel::SerializableResource.new(object.card_stacks,  each_serializer: CardStackSerializer)
  end 
end
