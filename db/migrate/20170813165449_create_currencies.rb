class CreateCurrencies < ActiveRecord::Migration[5.0]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.decimal :amount

      t.timestamps
    end
  end
end
