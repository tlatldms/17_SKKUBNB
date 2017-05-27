class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :image_url, default:''
      
      t.timestamps null: false
    end
  end
end
