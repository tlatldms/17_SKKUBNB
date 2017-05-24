class CommentsController < ApplicationController
  def create
    @content = Content.find(params[:content_id])
    @comment = @content.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to @content
    
  end
  
  
  def edit
   @content = Content.find(params[:content_id])
   @comment = Comment.find(params[:id])
   authorize! :update, @comment
  end

  def update
    @content = Content.find(params[:id])
    @content.update(content_params)
    
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:content_id])
    @comment = Comment.find(params[:id])
    # @content.delete #only content
    @comment.destroy #content 자식들까지 삭제
    
    redirect_to @content # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
  end
  
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:body)
  end
end
