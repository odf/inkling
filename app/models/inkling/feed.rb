class Inkling::Feed < ActiveRecord::Base
  set_table_name 'inkling_feeds'

  acts_as_inkling "Inkling Feed"

  belongs_to :user
  has_many :inkling_feed_roles, :class_name => "Inkling::FeedRole"
  validates_presence_of :user
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 1
  validates :format, :feed_format => true
  validates_length_of :source, :minimum => 1

  private
  def feedable_class
    class_by_name format, 'Inkling::Feedable'
  end

  def source_class
    class_by_name source, 'Inkling::FeedSource'
  end

  def class_by_name name, interface = 'class'
    unless name =~ /^[A-Za-z_][A-Za-z0-9_]*(::[A-Za-z_][A-Za-z0-9_]*)$/
      throw "Invalid #{interface} name #{name.inspect}"
    end
    eval name
  end
end
