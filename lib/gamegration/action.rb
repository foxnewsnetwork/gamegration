module Gamegration
  class Action
    attr_reader :name

    def initialize(name, &action)
      @action = action
      @name = name
    end

    def call(initial_state)
      @action.call initial_state
    end

    def at(node)
      action_node_relationships.where(:node => node)
    end
  end
end