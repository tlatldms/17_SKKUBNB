class ContentsController < ApplicationController
  
  before_action :authorize, only: [:new, :edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
    @contents = Content.all
  end

  def show
    @content = Content.find(params[:id])
  end

  def new
    @content = Content.new
    
  end

  def create
    @content=Content.new(content_params)
    
    uploader = MachineUploader.new
    uploader.store!(params[:pic])
    @content.image_url = uploader.url
    @content.save
    
    redirect_to content_path(@content)
    
  end

  def edit
     @content = Content.find(params[:id])
     authorize! :update, @content
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:id])
    # @content.delete #only content
    @content.destroy #content 자식들까지 삭제
    
    redirect_to contents_url # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
  end
  
  def rate2
    @rate2 = Content.find(params[:id])
    @rate2 = Content.new
  end
  
  private
  
  def authorize
    redirect_to new_session_path if current_user.nil?
  end
  
  
  def content_params
    params.require(:content).permit(:title, :body, :user_id, :image_url, :rate2_id, :pic)
    # :image 추가 >> 사진 저장
  end
  
  
end
