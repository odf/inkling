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
        # @sources = Inkling::Log.find(:all, :order => 'created_at DESC', :limit => 100)
        # Each source in @sources should respond to to_feedable which should return a hash with keys:
        # :title, :url, :updated_at, and either :html or :text
        # @feed = Inkling::Feed::Format::Atom.new(@sources, options)

        render :xml => @feed.generate
      end
    end
  end
end
