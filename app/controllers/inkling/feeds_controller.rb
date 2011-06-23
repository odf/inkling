class Inkling::FeedsController < ApplicationController
  
  #this assumes a format of xml. For other formats simply inherit from the controller and override show
  def show
    @feed = Inkling::Feed.find(params[:id])
    
    respond_to do |format|
      format.xml do
        render :xml => @feed.generate, :layout => false
      end
    end
  end
end
