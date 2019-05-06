class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_customer_id
      # Une stripe_customer_id, qui est un string et qui est l'identifiant unique donné par Stripe au payeur (pratique pour aller chercher ses informations).
      t.timestamps

      t.references :attendee, index: true
      t.belongs_to :event
    end
  end
end
