class Inkling::Feeds::LogSource
  
  def self.list(criteria = nil)
    Inkling::Log.find(:all, :order => 'created_at DESC', :limit => 100)
  end
end