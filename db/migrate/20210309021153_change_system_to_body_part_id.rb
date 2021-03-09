class ChangeSystemToBodyPartId < ActiveRecord::Migration[6.1]
  def change
    remove_column :study_groups, :system, :string
    add_column :study_groups, :body_part_id, :integer
  end
end
