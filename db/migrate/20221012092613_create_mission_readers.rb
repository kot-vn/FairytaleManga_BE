class CreateMissionReaders < ActiveRecord::Migration[6.1]
  def change
    create_table :mission_readers do |t|
      t.belongs_to :reader
      t.belongs_to :mission
      t.time :time_login
      t.time :time_readstory
      t.timestamps
    end
  end
end
