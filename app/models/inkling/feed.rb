class Inkling::Feed < ActiveRecord::Base
  set_table_name 'inkling_feeds'

  acts_as_inkling "Inkling Feed"

  belongs_to :user, :class_name => "Inkling::User", :foreign_key => :user_id
  has_many :inkling_feed_roles, :class_name => "Inkling::FeedRole"
  validates_presence_of :user
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 1
  # validates :format, :feed_format => true
  validates_length_of :source, :minimum => 1
  validates_length_of :format, :minimum => 1
  
  validate :format_required_method, :message => "An Inkling::Feeds::Format must implement self.generate(source_class)."
  validates_length_of :source, :minimum => 1

  def generate
    format_class.generate(source_class)
  end

  def format_required_method
    return if format.nil?
    format_class.respond_to? :generate
  end

  private
  def format_class
    # class_by_name format, 'Inkling::Feedable'
    format.constantize
  end

  def source_class
    # class_by_name source, 'Inkling::FeedSource'
    source.constantize
  end

  # def class_by_name name, interface = 'class'
  #   unless name =~ /^[A-Za-z_][A-Za-z0-9_]*(::[A-Za-z_][A-Za-z0-9_]*)$/
  #     throw "Invalid #{interface} name #{name.inspect}"
  #   end
  #   eval name
  # end
end
