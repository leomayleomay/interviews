require 'rubygems'
require 'rspec'

require File.expand_path("../../questions/dup.rb", __FILE__)

describe Dup::S1 do
  describe "#push_duplicates_back" do
    it "should push the duplicated element to the end" do
      array = [1, 2, 2, 3, 3, 3, 4, 5, 5]

      array.extend(Dup::S1)

      array.push_duplicates_back.should == [1, 2, 3, 4, 5, 2, 3, 3, 5]
    end
  end
end

describe Dup::S2 do
  describe "#push_duplicates_back" do
    it "should push the duplicated element to the end" do
      array = [1, 2, 2, 3, 3, 3, 4, 5, 5]

      array.extend(Dup::S2)

      array.push_duplicates_back.should == [1, 2, 3, 4, 5, 2, 3, 3, 5]
    end
  end
end
