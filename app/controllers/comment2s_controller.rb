class Comment2sController < ApplicationController
     def create
    @content = Content2.find(params[:content2_id])
    @comment = @content.comment2s.new(comment2_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to @content
    
     end
     
    def destroy
    @content = Content2.find(params[:content2_id])
    @comment = Comment2.find(params[:id])
    # @content.delete #only content
    @comment.destroy #content 자식들까지 삭제
    
    redirect_to @content # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
    end
  
  
  private
  
  def comment2_params
    params.require(:comment2).permit(:body)
  end
end
