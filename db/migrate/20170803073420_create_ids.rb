class CreateIds < ActiveRecord::Migration[5.0]
  def change
    create_table :ids do |t|
      t.string :first_name
      t.string :second_name
      t.string :sir_name
      t.string :other_name
      t.date :dob
      t.string :bio

      t.timestamps
    end
  end
end
