require 'inkling/feed/format'
require 'atom'
require 'digest/sha1'

class Inkling::Feed::Format::Atom < Inkling::Feed::Format
  def generate
    feed = ::Atom::Feed.new do |f|
      f.title = @title
      f.links << ::Atom::Link.new(:href => @options[:url]) if @options[:url]
      updated = @sources.map{|s| s[:updated_at]}.max || Time.now
      f.updated = updated.to_s(:iso8601)
      f.authors << ::Atom::Person.new(:name => @options[:authors]) if @options[:authors]
      f.id = 'tag:'+@id

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
