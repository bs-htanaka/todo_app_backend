class AddColumnIsDone < ActiveRecord::Migration[5.2]
  def up
    add_column :todos, :is_done, :boolean, default: false, null: false
  end

  def down
    remove_column :todos, :is_done, :boolean
  end
end
