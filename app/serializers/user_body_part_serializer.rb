class UserBodyPartSerializer < ActiveModel::Serializer
  attributes :id, :card_stack_id, :body_part, :comments

  def body_part
    object.body_part
  end 

  def comments 
    object.comments
  end 
end
