class UserMailer < ActionMailer::Base
=begin
default :from => "me@mydomain.com"

 def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
 end
=end
end #end없다고 자꾸 오류ㅓ서이거하나만추가할겡..
 #이메일 인증
