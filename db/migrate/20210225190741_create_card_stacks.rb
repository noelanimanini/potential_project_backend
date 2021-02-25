class CreateCardStacks < ActiveRecord::Migration[6.1]
  def change
    create_table :card_stacks do |t|
      t.string :title
      t.integer :user_id
      t.string :description
      t.timestamps
    end
  end
end
