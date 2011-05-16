class Inkling::Feed < ActiveRecord::Base
  set_table_name 'inkling_feeds'

  acts_as_inkling "Inkling Feed"

  # belongs_to :user
  has_many :inkling_feed_roles, :class_name => "Inkling::FeedRole"
  # validates_presence_of :user
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 1
  validates_length_of :source, :minimum => 1
  validates_length_of :format, :minimum => 1
  
  validate :format_required_method, :message => "An Inkling::Feeds::Format must implement self.generate(feed)."
  validates_length_of :source, :minimum => 1

  def generate
    format_class.generate(self)
  end

  def format_required_method
    return if format.nil?
    format_class.respond_to? :generate
  end
  def format_class
    format.constantize
  end

  def source_class
    source.constantize
  end

end
