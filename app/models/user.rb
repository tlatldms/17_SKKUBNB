class User < ActiveRecord::Base
# before_create :confirmation_token  
  
  rolify
    has_secure_password
    has_many :contents
    has_many :content2s
    has_many :comments
    has_many :comment2s
    has_many :rate2s
    
    
    validates :email, uniqueness: true, allow_blank: false
    validates :stringid, uniqueness: true, allow_blank: false
    #위에는 이메일 하나에 대해서 여러가지 옵션을 줄수있음
    
    #validates_uniqueness_of :email, :stringid
    #유효성(유니크) 검사를 여러개의 데이터에서 적용가능.
    
    
=begin    
    private
      def confirmation_token
        if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
      end
      
     def email_activate
        self.email_confirmed = true
        self.confirm_token = nil
        save!(:validate => false)
     end
    #이메일 인증
=end    
end
