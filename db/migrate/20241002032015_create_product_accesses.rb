class CreateProductAccesses < ActiveRecord::Migration[7.1]
  def change
    create_table :product_accesses do |t|
      t.references :client, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
