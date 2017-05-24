class Content < ActiveRecord::Base
    mount_uploader :image, ImageUploader
    #이미지 업로드(여진)
    
    
    has_many :comments
    has_many :rates
    belongs_to :user
end
