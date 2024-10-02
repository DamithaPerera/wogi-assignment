class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :currency
      t.references :brand, null: false, foreign_key: true
      t.string :state
      t.jsonb :customizable_fields

      t.timestamps
    end
  end
end
