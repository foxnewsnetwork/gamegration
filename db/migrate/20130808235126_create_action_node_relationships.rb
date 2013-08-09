class CreateActionNodeRelationships < ActiveRecord::Migration
  def change
    create_table :action_node_relationships do |t|
      t.integer :action_id
      t.integer :node_id
      t.integer :utility
    end
  end
end
