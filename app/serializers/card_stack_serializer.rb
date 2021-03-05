class CardStackSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id, :user_body_parts
  # has_many :user_body_parts
  # has_many :body_parts, through: :user_body_parts

  def user_body_parts
    ActiveModel::SerializableResource.new(object.user_body_parts,  each_serializer: UserBodyPartSerializer)
  end 
end
