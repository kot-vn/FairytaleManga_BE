class CreateJoinTableCategoryStory < ActiveRecord::Migration[6.1]
  def change
    create_join_table :category, :story do |t|
      t.index :category_id
      t.index :story_id
      t.timestamps
    end
  end
end
