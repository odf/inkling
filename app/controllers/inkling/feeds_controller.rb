class Inkling::FeedsController < ApplicationController
  
  respond_to :rss, :atom, :xml

  def show
    @feed = Inkling::Feed.find(params[:id])
    respond_with @feed.generate, :layout => false
  end
end
