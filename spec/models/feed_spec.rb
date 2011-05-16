require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Feed do

  it "should allow creation of a new feed" do
    f = Inkling::Feed.create(
        :authors => "test user1, testuser2",
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
    feed = Inkling::Feed.make(:format => "Inkling::Feeds::Atom", :source => "Inkling::Feeds::LogSource", :authors => "user1, user2")
    #make some test data
    5.times {|i| Inkling::Log.make}
    xml = feed.generate
    puts xml
    xml.should_not be_nil
  end
end
