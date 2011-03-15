require File.dirname(__FILE__) + '/../spec_helper'

# This class must exist or the format validation fails
# class TestAtom
#   # The generate method makes it look like a good Inkling::Feed::Format:
#   def generate feedable
#   end
# end

describe Inkling::Feed do
  let(:user) {Inkling::User.create!(:email => "admin@localhost.com", :password => "test123", :password_confirmation => "test123")}  

  it "should allow creation of a new feed" do
    f = Inkling::Feed.create(
        :user => user,
        :title => 'Some title',
        :format => 'TestAtom',
        :criteria => '',
        :source => 'String'
      )
    if f.errors.size != 0
      puts "Unexpected errors: #{f.errors.to_a*', '}"
    end
    f.errors.size.should == 0
  end

  it "should enforce required fields" do
    attrs = {
        :user => user,
        :title => 'Some title',
        :format => 'TestAtom',
        :source => 'String'
      }
    # Try dropping each field one at a time
    attrs.keys.each do |k|
      f = Inkling::Feed.new(attrs.except k)
      f.valid?.should == false
    end
  end
  
  it "should work with Inkling::Feeds::Atom and Inkling::Feeds::LogSource" do
    feed = Inkling::Feed.make(:format => "Inkling::Feeds::Atom", :source => "Inkling::Feeds::LogSource")
    #make some test data
    99.times {|i| Inkling::Log.make}
    xml = feed.generate
    puts xml
    xml.should_not be_nil
  end
end
