class Admin::Inkling::UsersController < Admin::Inkling::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::Role, :instance_name => 'role'

end