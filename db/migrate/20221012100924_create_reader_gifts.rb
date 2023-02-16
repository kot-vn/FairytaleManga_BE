class CreateReaderGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :reader_gifts do |t|
      t.belongs_to :reader
      t.belongs_to :gift
      t.boolean :received, :null => false, :default => false
      t.timestamps
    end
  end
end
