class CardStackSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :user_id
  has_many :user_body_parts
  has_many :body_parts, through: :user_body_parts
end
