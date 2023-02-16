class CreateReaderStories < ActiveRecord::Migration[6.1]
  def change
    create_table :reader_stories do |t|
      t.belongs_to :reader
      t.belongs_to :story
      t.integer :chap
      t.timestamps
    end
  end
end
