class CreateOrderItems < ActiveRecord::Migration[7.0]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, foreign_key: true, index: true, type: :uuid
      t.belongs_to :product, foreign_key:true, index: true
      t.integer :quantity, null: false
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end
