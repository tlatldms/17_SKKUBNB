class SessionsController < ApplicationController
  def new
  end
  
  def create
    user=User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      #로그인 성공
      session[:user_id]=user.id
      redirect_to contents_path
    else
      #로그인 실패
      flash[:alert]='아이디나 비밀번호가 틀렸습니다.'
      render 'new'
    end
  end
    
    def destroy
      session.delete(:user_id)
      @current_user = nil
      
      redirect_to contents_path
      
    end
end
