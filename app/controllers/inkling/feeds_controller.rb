class Inkling::FeedsController < Inkling::BaseController
  inherit_resources
  defaults :resource_class => Inkling::Feed, :instance_name => 'feed'
end
