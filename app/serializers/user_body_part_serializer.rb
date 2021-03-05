class UserBodyPartSerializer < ActiveModel::Serializer
  attributes :id, :card_stack_id, :body_part

  def body_part
    object.body_part
  end 
end
