class Inkling::RoleMembership < ActiveRecord::Base
  set_table_name 'inkling_role_memberships'

  belongs_to :user
  belongs_to :role, :class_name => "Inkling::Role", :foreign_key => :role_id

  validate :unique_user_and_role

  def unique_user_and_role 
  	if self.new_record?
  		pre_existing = Inkling::RoleMembership.find_by_user_id_and_role_id(user.id, role.id)
  		errors.add(:user, "already has membership in #{role.name}") if pre_existing
  	end
  end
end
