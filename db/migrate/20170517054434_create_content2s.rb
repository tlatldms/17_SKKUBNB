class CreateContent2s < ActiveRecord::Migration
  def change
    create_table :content2s do |t|
      
      t.string :title
      t.text :body
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
