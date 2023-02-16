class CreateTableReport < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.belongs_to :reader
      t.belongs_to :comment
      t.timestamps
    end
  end
end
