class Inkling::Feed < ActiveRecord::Base
    include Inkling::Util::Slugs
    
  set_table_name 'inkling_feeds'
  acts_as_inkling "Inkling Feed"

  serialize :criteria #stored as a hash, the source class can do whatever it wants with it
  
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 1
  validates_presence_of :format
  validate :format_required_method, :message => "An Inkling::Feeds::Format must implement self.generate(feed)."
  validates_length_of :source, :minimum => 1

  # def format_is_a_symbol
  #   unless format.is_a? Symbol
  #     errors.add(:format, "The format should be a symbol - :atom, :rss, etc..")
  #   end
  # end

  # This method creates the slug to store on the Inkling::Path (see Inkling::Path) 
  def generate_path_slug
    slug = "/#{sluggerize(self.title)}.#{format_class.responds_to.to_s}"
  end
  
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
