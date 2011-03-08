class Inkling::FeedRole < ActiveRecord::Base
  set_table_name 'inkling_feed_roles'

  belongs_to :inkling_feed, :class_name => "Inkling::Feed"
  belongs_to :inkling_role, :class_name => "Inkling::Role"
end
