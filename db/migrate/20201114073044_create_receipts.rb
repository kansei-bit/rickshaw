class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :customer_name, null: false, default: ""
      t.integer :fee
      t.boolean :cashless
      t.integer :course_id
      t.integer :adult_id
      t.integer :child_id
      t.boolean :group
      t.string :departure_from, null: false, default: ""
      t.string :arrive_at, null: false, default: ""
      t.time :departure_time
      t.time :arrival_time
      t.string :overtime
      t.string :course_time
      t.references :shafu, foreign_key: true
      t.timestamps
    end
  end
end
