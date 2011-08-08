require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::RoleMembership do
  
  specify "that users may not belong to the same role 2x" do
	user = User.make
	role = Inkling::Role.make
	role << user
	role.users.count.should == 1    
  end
end
