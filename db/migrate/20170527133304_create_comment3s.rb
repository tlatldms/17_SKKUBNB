class CreateComment3s < ActiveRecord::Migration
  def change
    create_table :comment3s do |t|
      t.text :body
      t.integer :content3_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
