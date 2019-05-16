class Rate2sController < ApplicationController

  def create
    @content = Content.find(params[:content_id])
    @rate2s=Rate2.all
    @rate2 = @content.rate2s.new(rate2_params)
    @rate2.user = current_user
    @rate2.save
    
    redirect_to :back
    
  end
  
  def new
    @rate2s=Rate2.all
    @rate2 = @content.rate2s.new(rate2_params)
    @rate2 = Rate2.find(params[:id])
    
    redirect_to :back
  end
  
  
  def edit
   @content = Content.find(params[:id])
   @rate2 = Rate2.find(params[:id])
   authorize! :update, @content
  end

  def update
    @content = Content.find(params[:content_id])
    @rate2 = Rate2.find(params[:id])
    
    @content.update(content_params)
    
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:content_id])
    @rate2 = Rate2.find(params[:id])
    @rate2.destroy 
 
    redirect_to :back 
    
  end
  
  
  
  private
  
  def rate2_params
    params.require(:rate2).permit(:body, :title, :rateinteger, :rate2_id)
  end    
end
