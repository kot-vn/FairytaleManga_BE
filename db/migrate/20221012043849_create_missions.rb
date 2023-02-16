class CreateMissions < ActiveRecord::Migration[6.1]
  def change
    create_table :missions do |t|
      t.string :name, :null => false, :default => "null"
      t.integer :score
      #Ex:- :default =>''
      t.timestamps
    end
  end
end
