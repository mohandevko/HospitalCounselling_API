class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.integer :phone_number
      t.string :specialization

      t.timestamps
    end
  end
end
