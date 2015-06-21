class CreatePractices < ActiveRecord::Migration
  def change
    create_table :practices do |t|
      t.integer :user_id
      t.string :title
      t.string :unit

      t.timestamps null: false
    end
  end
end
