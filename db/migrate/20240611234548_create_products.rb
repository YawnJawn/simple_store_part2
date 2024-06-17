class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :price
      t.string :decimal
      t.string :stock_quantity
      t.string :integer

      t.timestamps
    end
  end
end
