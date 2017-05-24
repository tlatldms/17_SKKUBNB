class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.string :body
      t.string :title
      
      t.integer :content_id
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
