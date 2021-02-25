class CreateBodyParts < ActiveRecord::Migration[6.1]
  def change
    create_table :body_parts do |t|
      t.string :title
      t.string :image
      t.string :link

      t.timestamps
    end
  end
end
