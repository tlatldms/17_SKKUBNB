class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
 def create 
     @user = User.new(user_params) 
     if @user.save 
         #회원가입이 성공했을때
        
        session[:user_id] = @user.id
         mg_client = Mailgun::Client.new("key-b267841ce6f49819448ed74e9fba95b4")

         message_params =  {
                   from: 'master@SKKUBNB.com',
                   to:   @user.email,
                   subject: 'SKKUBNB에 오신것은 WELCOME합니다',
                   text:    '가입ㅊㅋㅊ'
                  }

        result = mg_client.send_message('sandbox534d75e93f794ae7ade75cf4338f6deb.mailgun.org', message_params).to_h!

        message_id = result['id']
        message = result['message']

       redirect_to contents_path 
     else 
       render "new" 
     end 
   #이메일이메일이메일
  end
    
    
  #   #권한부여
  def edit
    current_user.add_role :admin
    redirect_to contents_path
  end
  
  # def update
  #   current_user.remove_role :admin
  #   current_user.add_role :moder
  #   redirect_to contents_path
  # end
  
  # def cow
  #   current_user.remove_role :admin
  #   current_user.remove_role :moder
  #   current_user.add_role :cow
  #   redirect_to contents_path
  # end
    

#  def create
 #       @user = User.new(user_params)    
  #    if @user.save
   #     UserMailer.registration_confirmation(@user).deliver
    #    flash[:success] = "진행하기 위해서 이메일을 컨펌해주세요"
     #   redirect_to root_url
    #  else
     #   flash[:error] = "다시 써!"
      #  render 'new'
  #    end
#  end
  
#def confirm_email
  #  user = User.find_by_confirm_token(params[:id])
   # if user
    #  user.email_activate
     # flash[:success] = "Welcome to the Sample App! Your email has been confirmed.
      #Please sign in to continue."
    #  redirect_to signin_url
    #else
 #     flash[:error] = "Sorry. User does not exist"
#      redirect_to root_url
  #  end
#end

  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :stringid, :realname)
  end
 

end