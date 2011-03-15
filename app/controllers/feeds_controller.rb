class FeedsController < ApplicationController

  # Valid options are:
  # :title
  # :subtitle
  # :authors
  # :contributors
  # :domain
  # :id

  # options = {
  #   :title => "Inkling log",
  #   :id => request.url
  # }

  def show
    @feed = Inkling::Feed.find(params[:id])

    respond_to do |format|
      # format.html # show.html.erb
      format.xml do
        render :xml => @feed.generate
      end
    end
  end
end
