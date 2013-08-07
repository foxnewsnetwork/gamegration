module Gamegration
  class Rule
    attr_reader :name

    def initialize(name, &check)
      @name = name
      @check = check
    end

    def allowed?(action, node_state)
      check.call action, node_state
    end

  end
end