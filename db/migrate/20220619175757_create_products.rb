class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 50, null: false
      t.text :description, limit: 255
      t.decimal :price, precision: 8, scale: 2, null: false
      t.boolean :active
      t.belongs_to :category, foreign_key: true, index: true, null: false

      t.timestamps
    end

    change_column_default :products, :active, from: false, to: true
  end
end
