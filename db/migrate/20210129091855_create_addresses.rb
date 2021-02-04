class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,      null: false, default: ""
      t.integer :prefectures_id,  null: false
      t.string :city,             null: false, default: ""
      t.string :addresses,        null: false, default: ""
      t.string :building,         null: false
      t.string :phone_number,     null: false, default: ""
      t.references :order,        foreign_key: true
      t.timestamps
    end
  end
end
