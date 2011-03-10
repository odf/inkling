require File.dirname(__FILE__) + '/../spec_helper'

describe Inkling::Path do
  
  specify "that inkling::path is deleted when the inkling obj is deleted" do
    feed = Inkling::Feed.make(:format => "TestAtom")
    feed.path.should_not be_nil
    url = feed.path.slug
    feed.destroy
    Inkling::Path.find_by_slug(url).should be_nil
  end
end
