class AddReferenceMealToCategory < ActiveRecord::Migration
  def change
    add_reference :meals, :category, index: true
  end
end
