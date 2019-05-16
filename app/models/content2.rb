class Content2 < ActiveRecord::Base
    has_many :comment2s
    belongs_to :user
    
    def self.search(search)
        if search
          where('title LIKE ? or body LIKE ?',"%#{search}%", "%#{search}%")
        else
          all
        end
    end
    
end
