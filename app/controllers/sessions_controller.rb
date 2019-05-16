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
    
    
# def create 
#     @user = User.new(user_params) 
#     if @user.save 
#       UserMailer.registration_confirmation(@user).deliver
#     flash[:success] = "등록성공.이메일 확인"
#     redirect_to root_url
#     else 
#       render "new" 
#     end 
#   end 

 def confirm_email
	user = User.find_by_confirm_token(params[:id])
	if user_params
	    user.email_activate
	    flash[:success] = 'welcome'
	    redirect_to root_url
    else
    	flash[:error] = 'Error'
	    redirect_to root_url
    end
 end
 



end
