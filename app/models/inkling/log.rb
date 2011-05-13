class Inkling::Log < ActiveRecord::Base
  set_table_name 'inkling_logs'
  
  belongs_to :user
  
  validates_presence_of :category
  validates_presence_of :text  

  SYSTEM  = "inkling system"
  USERS   = "users"

  def to_feedable
    {
      :title => "LOG by #{user_id.inspect}",  # REVISIT
      :url => "/logs/#{id}",
      :updated_at => created_at,
      :text => text
    }
  end
end
