class CreateOptionsOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :options_order_items do |t|
      t.references :option, foreign_key: true
      t.references :order_item, foreign_key: true

      t.timestamps
    end
  end
end
