class CreateGroupsOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :groups_order_items do |t|
      t.references :group, foreign_key: true
      t.references :order_item, foreign_key: true

      t.timestamps
    end
  end
end
