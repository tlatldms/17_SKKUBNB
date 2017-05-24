class CreateComment2s < ActiveRecord::Migration
  def change
    create_table :comment2s do |t|
      t.text :body
      t.integer :content2_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
