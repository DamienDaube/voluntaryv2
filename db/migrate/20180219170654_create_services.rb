class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :category
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
