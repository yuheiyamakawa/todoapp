class RemoveDeadlineFromCards < ActiveRecord::Migration[6.0]
  def change
    remove_column :cards, :deadline, :datetime
  end
end
