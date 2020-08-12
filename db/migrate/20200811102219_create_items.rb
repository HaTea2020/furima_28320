class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image,               null: false
      t.string :name,                null: false
      t.text :explanation,           null: false
      t.integer :genre,              null: false
      t.integer :statue,             null: false
      t.integer :fee,                null: false
      t.integer :prefecture,         null: false
      t.integer :days,               null: false
      t.integer :price,              null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
