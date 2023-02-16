class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :liketable, polymorphic: true, null: false
      t.boolean :like , null: false, :default => true
      t.references :reader, null:false
      t.timestamps
    end
  end
end
