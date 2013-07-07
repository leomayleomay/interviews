require 'rubygems'
require 'rspec'

require File.expand_path("../../questions/sequence.rb", __FILE__)

describe Sequence do
  describe ".sort" do
    it "should sort bolts with nuts" do
      o = (0...3213).sort_by{rand}
      t = (0...3213).sort_by{rand}

      Sequence.sort(o, t).should == (0...3213).to_a
    end
  end
end
