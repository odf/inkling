class Inkling::RoleMembership < ActiveRecord::Base
  set_table_name 'inkling_role_memberships'

  belongs_to :user
  belongs_to :role, :class_name => "Inkling::Role", :foreign_key => :role_id
end
