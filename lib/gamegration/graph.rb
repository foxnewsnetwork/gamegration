class Gamegration::Graph

  attr_reader :total_utility

  def initialize(initial_node, origination_action=nil, past_utility=0)
    @total_utility = past_utility
    @current_node = initial_node
    _update_action_utility(origination_action, initial_node) if origination_action.present?
  end

  def maximize_utility!
    return total_utility if terminating?
    _update_present_utility
    _advance_to_next_node.maximize_utility!
  end

  def terminating?
    false
  end

  def _update_present_utility
    @total_utility += _current_node.utility 
  end

  def _update_action_utility(action, node)
    action.at(node).update_utility node.utility
  end

  def _advance_to_next_node
    self.class.new _next_node, _best_action, _next_node.utility
  end

  def _best_action
    @best_action ||= _expose_actions.lazy.sort do |action_a, action_b|
      _expected_utility(action_b) <=> _expected_utility(actiono_a)
    end.first
  end

  def _die_like_dog!
    throw :NotImplemented
  end

  def _expected_utility(action)
    action.at(_current_node).utility
  end

  def _expose_actions
    _current_node.actions
  end

  def _current_node
    @current_node
  end

  def _next_node
    return _die_like_dog! if _best_action.blank?
    @next_node ||= _best_action.call _current_node
  end

end
