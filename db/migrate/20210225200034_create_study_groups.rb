class CreateStudyGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :study_groups do |t|
      t.string :name
      t.datetime :date
      t.string :description

      t.timestamps
    end
  end
end
