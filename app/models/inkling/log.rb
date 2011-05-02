class Inkling::Log < ActiveRecord::Base
  set_table_name 'inkling_logs'
  
  belongs_to :user
  
  validates_presence_of :category
  validates_presence_of :text  

  SYSTEM  = "inkling system"
  USERS   = "users"
end