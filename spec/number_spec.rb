require 'rubygems'
require 'rspec'

require File.expand_path("../../questions/number.rb", __FILE__)

describe Number do
  describe "#str_to_int" do
    let (:number) {Number.new}

    context "the str passed in is nil" do
      it "returns 0" do
        number.str_to_int(nil).should == 0        
      end
    end

    context "the str passed in is an empty string" do
      it "returns 0" do
        number.str_to_int("").should == 0
      end
    end

    context "illegal input" do
      it "returns 0" do
        number.str_to_int("abcde").should == 0
      end
    end

    context "legal input" do
      it "converts the string to integer" do
        number.str_to_int("123").should == 123
      end
    end
  end
end
