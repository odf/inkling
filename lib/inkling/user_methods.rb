module Inkling
  module UserMethods
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_inkling_user
        has_many :role_memberships, :class_name => "Inkling::RoleMembership"#, :foreign_key => "user.id"
        has_many :roles, :class_name => "Inkling::Role", :through => :role_memberships
        has_many :logs
    
        send :include, InstanceMethods
    end
  end
  
    module InstanceMethods
      def has_role?(role)
        role = role.to_s
        self.roles.find_by_name(role)
      end
  end
  end
end
