class AddDescriptionToSkill < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :description, :text
  end
end
