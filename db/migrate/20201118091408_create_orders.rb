class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.reference :user, foreign_key: true
      t.reference :item, foreign_key: true
      t.timestamps
    end
  end
end
