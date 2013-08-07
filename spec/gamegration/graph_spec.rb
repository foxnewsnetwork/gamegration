require 'spec_helper'

describe Gamegration::Graph do
  class SpecGraph < Gamegration::Graph

  end

  class SpecNode < Gamegration::Node

  end

  describe "#paths" do
    before do
      @graph = SpecGraph.new
      @graph.search!
    end
    it "should search through and generate out the resultant path to victory" do

    end
  end
end