class CreateOderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :oder_details do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :amount, null: false
      t.integer :price_including_tax, null: false
      t.integer :production_status, default: 0, null: 0

      t.timestamps
    end
  end
end
