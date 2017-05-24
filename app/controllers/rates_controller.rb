class RatesController < ApplicationController
  
  def create
    @content = Content.find(params[:content_id])
    @rate = @content.rates.new(rate_params)
    @rate.user = current_user
    @rate.save
    
    redirect_to :back
    
  end
  
  
  def edit
   @content = Content.find(params[:id])
   authorize! :update, @content
  end

  def update
    @content = Content.find(params[:content_id])
    
    @content.update(content_params)
    
    redirect_to content_path(@content)
  end

  def destroy
    @content = Content.find(params[:content_id])
    @rate = Rate.find(params[:id])
    @rate.destroy 
    
    redirect_to :back 
    
  end
  
  
  
  private
  
  def rate_params
    params.require(:rate).permit(:body, :title)
  end    
end
