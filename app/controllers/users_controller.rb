class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @stringid = User.find_by(params[:stringid])
    if @user.save
      #회원가입이 성공했을 때
      login(@user)
      redirect_to contents_path
    else
      #회원가입이 실패했을 때
      render 'new'
    end
    
    if @stringid.nil?
      flash[:alert]='아이디를 입력해 주십시오.'
    end
  end
    
  def edit
    current_user.add_role :admin
    redirect_to contents_path
  end
  
  def update
    current_user.remove_role :admin
    current_user.add_role :moder
    redirect_to contents_path
  end
  
  def cow
    current_user.remove_role :admin
    current_user.remove_role :moder
    current_user.add_role :cow
    redirect_to contents_path
  end
    



  private
  
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :stringid, :realname)
  end
  
end
