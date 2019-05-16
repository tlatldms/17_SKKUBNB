class CreateContent3s < ActiveRecord::Migration
  def change
    create_table :content3s do |t|
      t.string :title
      t.text :body
      t.date :date
      t.integer :user_id
      t.string :campus
      t.string :gender
      t.timestamps null: false
    end
  end
end
