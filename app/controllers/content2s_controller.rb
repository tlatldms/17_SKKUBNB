class Content2sController < ApplicationController
  
  before_action :authorize, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @contents = Content2.all
  end

  def show
    @content = Content2.find(params[:id])
  end

  def new
    @content = Content2.new
    
  end

  def create
    @content=Content2.new(content2_params)
    @content.save
    
    redirect_to content2_path(@content)
    
  end

  def edit
     @content = Content2.find(params[:id])
     authorize! :update, @content
  end

  def update
    @content = Content2.find(params[:id])
    @content.update(content_params)
    
    redirect_to content2_path(@content)
  end

  def destroy
    @content = Content2.find(params[:id])
    # @content.delete #only content
    @content.destroy #content 자식들까지 삭제
    
    redirect_to contents_url # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
  end
  
  
  private
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end
  
  
  def content2_params
    params.require(:content2).permit(:title, :body, :user_id)
  end
  
end
