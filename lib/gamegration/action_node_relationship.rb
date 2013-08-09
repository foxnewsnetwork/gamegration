class Gamegration::ActionNodeRelationship < ActiveRecord::Base

  belongs_to :action, :foreign_key => "action_id", :class_name => "Gamegration::Action::ActionIdentifier"
  belongs_to :node, :foreign_key => "node_id", :class_name => "Gamegration::Node::NodeIdentifier"

  def utility

  end

end