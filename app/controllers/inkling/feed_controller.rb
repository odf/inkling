class Inkling::FeedController < Inkling::BaseController
  inherit_resources                                                                                     
  defaults :resource_class => Inkling::Feed, :instance_name => 'inkling_feed'
end
