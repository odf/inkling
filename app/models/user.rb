#this is a dummy class to be overridden by the hosting app.
#engine classes can be overridden.

class User < ActiveRecord::Base
  has_many :role_memberships
  has_many :roles, :through => :role_memberships
  has_many :logs
  
  def has_role?(role)
    role = role.to_s
    self.roles.find_by_name(role)
  end
end