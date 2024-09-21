class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :status
      t.string :address

      t.timestamps
    end
  end
end
