# frozen_string_literal: true

class DeviseCreateReaders < ActiveRecord::Migration[6.1]
  def change
    create_table :readers do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :name , null: false , default: ""     
      t.integer :age , null: false , default: "0"
      t.boolean :gender
      t.string :phonenumber, null:false, default: ""
      t.boolean :ban
      t.string :address, null: false, default: ""
      t.integer :score, default: "0"

      t.timestamps null: false
    end

    add_index :readers, :email,                unique: true
  end
end
