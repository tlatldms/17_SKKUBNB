class Comment3sController < ApplicationController
    
    def create
    @content = Content3.find(params[:content3_id])
    @comment = @content.comment3s.new(comment3_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to @content
    
    end

  
    private
    
    def comment3_params
    params.require(:comment3).permit(:body)
    end
end
