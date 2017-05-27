class Content3 < ActiveRecord::Base
    has_many :comment3s
    belongs_to :user
end
