class AddIndexIn < ActiveRecord::Migration[6.1]
  def change
    change_column :stories, :end, :boolean, null: false, default: '0'
  end
end
