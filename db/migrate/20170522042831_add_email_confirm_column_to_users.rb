class AddEmailConfirmColumnToUsers <     ActiveRecord::Migration
 
=begin
def change
    add_column :users, :email_confirmed, :boolean, :default => false
    add_column :users, :confirm_token, :string
 end

=end
end
#이메일 인증