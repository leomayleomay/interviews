require 'rubygems'
require 'rspec'

require File.expand_path("../../questions/tree.rb", __FILE__)

describe BinaryTree do

  shared_examples "printing binary tree level by level" do
    context "1 level" do
      [
        [6, "6"],
        [8, "8"],
      ].each do |value, output|
          it "print root's value" do
            root.value = value

            tree.print_by_level.should == output
          end
        end
    end

    context "2 levels" do
      it "prints by level" do
        left = Node.new(3)

        root.value = 6
        root.left = left

        tree.print_by_level.should == "6|3"
      end

      it "prints by level" do
        right = Node.new(3)

        root.value = 6
        root.right = right

        tree.print_by_level.should == "6|3"
      end

      it "prints by level" do
        left = Node.new(1)
        right = Node.new(3)

        root.value = 6
        root.left = left
        root.right = right

        tree.print_by_level.should == "6|1 3"
      end
    end

    context "3 levels" do
      it "prints by level" do
        #                      6
        #                     / \
        #                   2   5
        #                   \  / \
        #                   1 2  4

        left = Node.new(2)
        left.right = Node.new(1)

        right = Node.new(5)
        right.left = Node.new(2)
        right.right = Node.new(4)

        root.value = 6
        root.left = left
        root.right = right

        tree.print_by_level.should == "6|2 5|1 2 4"
      end
    end
  end

  describe ".print_by_level" do
    let (:root) {Node.new} 
    let (:tree) {BinaryTree.new(root, printer)}

    context "loop printer" do
      let (:printer) {LoopPrinter.new}

      it_should_behave_like "printing binary tree level by level"
    end 

    context "recursive printer" do
      let (:printer) {RecursionPrinter.new}

      it_should_behave_like "printing binary tree level by level"
    end
  end
end

