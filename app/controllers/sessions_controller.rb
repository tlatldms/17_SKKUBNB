class SessionsController < ApplicationController
  def new
  end
  
  def create
    
      user= User.find_by(email: params[:emailorid])||User.find_by(stringid: params[:emailorid])
    
    # if User.find_by(email: params[:email])
    #   user=User.find_by(email: params[:email])
    # elsif User.find_by(stringid: params[:stringid])
    # User.find_by(stringid: params[:stringid])
    
    if user && user.authenticate(params[:password])
      #로그인 성공
      session[:user_id]=user.id
      redirect_to home_path
    else
      #로그인 실패
      flash[:alert]='아이디나 비밀번호가 틀렸습니다.'
      render 'new'
    end
    
  end
    
    def destroy
      session.delete(:user_id)
      @current_user = nil
      
      redirect_to :back
      
    end
=begin
def create
      user = User.find_by_email(params[:email].downcase)
      if user && user.authenticate(params[:password])
      if user.email_confirmed
          sign_in user
        redirect_back_or user
      else
        flash.now[:error] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render 'new'
      end
      else
        flash.now[:error] = 'Invalid email/password combination' # Not quite right!
        render 'new'
      end
  end
  #이메일ㅇㅈ


=end
end
