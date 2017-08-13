class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.string :title
      t.text :description
      t.string :rating
      t.integer :user_id

      t.timestamps
    end
  end
end
