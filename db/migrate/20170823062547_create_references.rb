class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :name
      t.string :message

      t.timestamps
    end
  end
end
