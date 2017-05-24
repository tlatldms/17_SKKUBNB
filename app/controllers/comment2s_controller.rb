class Comment2sController < ApplicationController
     def create
    @content = Content2.find(params[:content2_id])
    @comment = @content.comment2s.new(comment2_params)
    @comment.user = current_user
    @comment.save
    
    redirect_to @content
    
     end
  
  
  private
  
  def comment2_params
    params.require(:comment2).permit(:body)
  end
end
