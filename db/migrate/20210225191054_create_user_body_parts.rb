class CreateUserBodyParts < ActiveRecord::Migration[6.1]
  def change
    create_table :user_body_parts do |t|
      t.integer :card_stack_id
      t.integer :body_part_id

      t.timestamps
    end
  end
end
