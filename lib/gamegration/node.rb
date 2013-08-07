module Gamegration
  class Node
    attr_reader :state

    def initialize(rules, actions, state=nil)
      @state = state || NodeState.default
      @rules = rules || []
      @actions = actions || []
    end

    def actions
      @actions.select { |action| allowed_by_rules? action }
    end

    def act(action)
      bind action.call self
    end

    def bind(node_state)
      Gamegration::Node.new @rules, @actions, node_state
    end

    def allowed_by_rules?(action)
      @rules.reduce(true) do |still_allowed, rule|
        still_allowed && rule.allow?(action, state)
      end
    end

    def children
      @children ||= actions.map { |action| action.call self }
    end


  end
end