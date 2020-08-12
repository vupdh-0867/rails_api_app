class CreateProductPrices < ActiveRecord::Migration[5.2]
  def change
    create_table :product_prices do |t|
      t.decimal :price
      t.integer :product_id
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
