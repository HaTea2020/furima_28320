class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.text :explanation,           null: false
      t.integer :genre_id,              null: false
      t.integer :statue_id,             null: false
      t.integer :fee_id,                null: false
      t.integer :prefecture_id,         null: false
      t.integer :days_id,               null: false
      t.integer :price,              null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
