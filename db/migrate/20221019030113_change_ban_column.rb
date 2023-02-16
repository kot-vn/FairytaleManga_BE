class ChangeBanColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :readers, :ban, :integer, default: 0
  end
end
