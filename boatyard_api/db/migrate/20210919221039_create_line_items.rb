class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :amount
      t.decimal :subtotal
      t.decimal :tax
      t.decimal :total
      t.references :order
      t.timestamps
    end
  end
end
