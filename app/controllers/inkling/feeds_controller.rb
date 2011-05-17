class Inkling::FeedsController < ApplicationController
  
  def show
    @feed = Inkling::Feed.find(params[:id])
    
    # puts @feed.generate
    
    puts " --------------------------- \n\n"
    
    respond_to do |format|
      # debugger
      # format.send(@feed.format) do
        render :xml => @feed.generate, :layout => false
      end
    # end
  end
end
