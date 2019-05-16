class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      
      # t.string :stringid
      # t.string :realname
      # #이 두개는 검색기능을 위해 추가
      
      
      
      t.string :image_url, default:''
      t.date :date
      t.integer :rate2_id
      t.string :campus
      t.string :gender
      t.string :shower
      t.string :airconditioner
      t.string :laundry
      t.timestamps null: false
    end
  end
end
