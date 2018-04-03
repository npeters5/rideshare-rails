class CreateTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :trips do |t|
      t.string :date
      t.float :rating
      t.float :cost
      t.references :driver, foreign_key: true
      t.references :passenger, foreign_key: true

      t.timestamps
    end
  end
end
