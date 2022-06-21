class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, null: false
      t.belongs_to :product, foreign_key: true, index: true
      t.belongs_to :cart, foreign_key: true, index: true, type: :uuid

      t.timestamps
    end
  end
end
