class Gamegration::Action 
  class ActionIdentifier < ActiveRecord::Base
    self.table_name = "actions"

    has_many :action_node_relationships, :class_name => "Gamegration::ActionNodeRelationship"
  end
  attr_reader :name

  def initialize(name, &action)
    @action = action
    @identifier = ActionIdentifier.find_by_name name
    @name = name
  end

  def call(initial_state)
    @action.call initial_state
  end

  def at(node)
    @identifier.action_node_relationships.where(:node => node)
  end
end
