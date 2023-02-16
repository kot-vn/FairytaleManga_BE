class ChangeBanColumnn < ActiveRecord::Migration[6.1]
  def change
    remove_column :readers, :ban
    add_column :readers, :ban, :integer, :null => false, default: 0
  end
end
