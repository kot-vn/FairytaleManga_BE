class AddColumnEnd < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :end, :boolean
  end
end
