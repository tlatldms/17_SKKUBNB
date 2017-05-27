class UserMailer < ActionMailer::Base
  default :from => "yunhaahn1125@gmail.com"

    def registration_confirmation(user)
	    @user = user
	    mail(:to => "#{user.nickname} <#{user.email}>", :subject => "please confrim your registration")
    end
end
 