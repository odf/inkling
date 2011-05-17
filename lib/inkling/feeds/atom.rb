require 'atom'
require 'digest/sha1'

class Inkling::Feeds::Atom 
  include Inkling::Feeds::Format
  
  def self.responds_to
    :atom
  end
  
  def self.generate(record)
    @sources = record.source_class.list(record.criteria)
    
    feed = ::Atom::Feed.new do |f|
      f.title = @title
      f.links << ::Atom::Link.new(:href => record.path.slug) 
      updated = @sources.map{|s| s[:updated_at]}.max || Time.now
    
      f.updated = updated.to_s(:iso8601)
      
      if record.authors
        authors = record.authors.split(",") 
      
        authors.each do |author|
          f.authors << ::Atom::Person.new(:name => "#{author}")
        end
      end
      
      f.id = 'tag:'+ record.id.to_s

      @sources.each do |source|
        entry = ::Atom::Entry.new do |e|
          atom = source.to_feedable
          e.title = atom[:title]
          url = atom[:url]        # This is the permalink URL where the article can be fetched or viewed
          e.links << ::Atom::Link.new(:href => url)
          e.id = "urn:uuid:#{Digest::SHA1.hexdigest(url)}"
          e.updated = atom[:updated_at].to_s(:iso8601)
          case
          when atom[:html]
            e.content = ::Atom::Content::Html.new(atom[:html])
          when atom[:text]
            e.content = ::Atom::Content::Text.new(atom[:text])
          end
        end
        f.entries << entry
      end
    end

    feed.to_xml
  end
end
