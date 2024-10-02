class AddCancelledAtToCards < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :cancelled_at, :datetime
  end
end
