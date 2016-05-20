class AddForeignKeyCategoryToWorkingHours < ActiveRecord::Migration
  def change
    add_reference :categories, :working_hour, index: true
  end
end
