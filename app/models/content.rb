class Content < ActiveRecord::Base
   
    
    has_many :comments
    has_many :rate2s
    belongs_to :user
end
