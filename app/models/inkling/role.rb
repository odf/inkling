class Inkling::Role < ActiveRecord::Base
  set_table_name 'inkling_roles'
  has_many :role_memberships, :class_name => "Inkling::RoleMembership", :foreign_key => "role_id"
  has_many :users, :through => :role_memberships
  has_many :permissions

  ADMIN = "administrator"

  validates_uniqueness_of :name

  def <<(user)
	 	if user.is_a? User
	 		Inkling::RoleMembership.create!(:role => self, :user => user)
	 	end
  end
end
