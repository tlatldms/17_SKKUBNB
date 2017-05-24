class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :stringid
      t.string :realname
      t.string :name #이것도 추가할게윤하얌
      
      t.timestamps null: false
    end
  end
end
