class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      # Un email, qui est un string (géré par la gem d'authentification que l'on verra demain)
      t.string :encrypted_password
      # Un encrypted_password, qui est un string(géré par la gem d'authentification que l'on verra demain)
      t.text :description
      # Une description, qui est un text
      t.string :name
      # Un first_name, qui est un string
      # Un last_name, qui est un string

      t.timestamps
    end
  end
end
