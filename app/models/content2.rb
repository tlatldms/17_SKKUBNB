class Content2 < ActiveRecord::Base
    has_many :comment2s
    
    belongs_to :user
end
