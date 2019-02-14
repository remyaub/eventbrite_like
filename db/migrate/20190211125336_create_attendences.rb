class CreateAttendences < ActiveRecord::Migration[5.2]
  def change
    create_table :attendences do |t|
      t.string :stripe_customer_id
      t.belongs_to :attendee, index: true
      t.belongs_to :event, index: true
      
      t.timestamps
    end
  end
end
