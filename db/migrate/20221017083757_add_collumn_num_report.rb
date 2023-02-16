class AddCollumnNumReport < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :num_report, :integer, :default => 0
  end
end
