class Comment3sController < ApplicationController
    
    def create
    @content = Content3.find(params[:content3_id])
    @comment = @content.comment3s.new(comment3_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to @content
    
    end
    
    def destroy
    @content = Content3.find(params[:content3_id])
    @comment = Comment3.find(params[:id])
    # @content.delete #only content
    @comment.destroy #content 자식들까지 삭제
    
    redirect_to @content # 'http://~' 절대경로
    # redirect_to contents_path #'/contents' 상대경로
    end

  
    private
    
    def comment3_params
    params.require(:comment3).permit(:body)
    end
end
