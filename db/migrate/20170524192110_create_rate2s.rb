class CreateRate2s < ActiveRecord::Migration
  def change
    create_table :rate2s do |t|
      t.string :body
      t.string :title
      
      t.integer :content_id
      t.integer :user_id
      t.integer :rateinteger

      t.timestamps null: false
    end
  end
end
