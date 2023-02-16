class ChangeReaders < ActiveRecord::Migration[6.1]
  def change
    add_column :readers, :activation_digest, :string
    add_column :readers, :activated, :boolean, default: false
    add_column :readers, :activated_at, :datetime
  end
end
