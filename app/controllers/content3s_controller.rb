class Content3sController < ApplicationController
    
  before_action :authorize, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @contents = Content3.all
    @contentss = @contents.paginate(page: params[:page], per_page: 10)
    @contents = Content3.search(params[:search])
  end
  
  def searchindex
    @contents = Content3.all
    @content = Content3.new
    @contents= Content3.search(params[:search]).reverse
  end

  def show
     @contents = Content3.all
    @content = Content3.find(params[:id])
  end

  def new
    @content = Content3.new
    
  end

  def create
    @content=Content3.new(content3_params)
    @content.save
    
    redirect_to content3_path(@content)
    
  end

  def edit
     @content = Content3.find(params[:id])
     authorize! :update, @content
  end

  def update
    @content = Content3.find(params[:id])
    @content.update(content3_params)
    
    redirect_to content3_path(@content)
  end

  def destroy
    @content = Content3.find(params[:id])
    # @content.delete #only content
    @content.destroy #content 자식들까지 삭제
    
    redirect_to content3s_url # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
  end
  
  
  private
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end
  
  
  def content3_params
    params.require(:content3).permit(:title, :body, :user_id, :date, :campus, :gender)
  end
end
