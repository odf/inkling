class Inkling::FeedsController < ApplicationController

  loyout 'none'
  
  def show
    @feed = Inkling::Feed.find(params[:id])

    respond_to do |format|
      format.xml do
        render :xml => @feed.generate
      end
    end
  end
end
