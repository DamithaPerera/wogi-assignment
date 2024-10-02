class CreateBrands < ActiveRecord::Migration[7.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :state, default: 'active'
      t.jsonb :customizable_fields

      t.timestamps
    end
  end
end
