class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :number
      t.string :date
      t.string :time
      t.string :departure
      t.string :arrival

      t.timestamps
    end
  end
end
