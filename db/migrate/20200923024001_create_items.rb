class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                      null: false, default: ""
      t.string :text,                      null: false, default: ""
      t.integer :category,                 null: false, default: "---"
      t.integer :status,                   null: false, default: "---"
      t.integer :shipping_fee,             null: false, default: "---"
      t.integer :prefecture,               null: false, default: "---"
      t.integer :scheduled_delivery,       null: false, default: "---"
      t.integer :price,                    null: false, default: ""
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
