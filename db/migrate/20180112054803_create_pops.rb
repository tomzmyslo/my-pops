class CreatePops < ActiveRecord::Migration[5.1]
  def change
    create_table :pops do |t|
      t.string :name
      t.string :number
      t.string :collection
      t.string :category
      t.boolean :exclusive
      t.string :exclusivity
      t.float :amount_paid
      t.float :ppg_price
      t.string :ppg_url
      t.integer :quantity
      t.string :condition
      t.string :box_number
      t.text :notes

      t.timestamps
    end
  end
end
