class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      # Une start_date, qui est un datetime.
      # Validations : sa présence est obligatoire, et il est impossible de créer ou modifier un événement dans le passé.
      t.integer :duration
      # Une duration, qui est un integer représentant le nombre de minutes que cet événement va durer.
      # Validations : Sa présence est obligatoire et le nombre de minutes doit être un multiple de 5, et est strictement positif
      t.string :title
      # Un title qui est un string.
      # Validations : Sa présence est obligatoire et doit faire au moins 5 caractères et maxi 140 caractères.
      t.text :description
      # Une description qui est un text.
      # Validations : Sa présence est obligatoire et la description doit faire entre 20 et 1000 caractères.
      t.integer :price
      # Un price qui est un integer. Ce price correspond au nombre d'euros que coûte l'événement.
      # Validations : Sa présence est obligatoire et cet integer doit être compris entre 1 et 1000. (pas d'événement gratuit pour cette première version de l'application)
      t.string :location
      # Une location, qui est un string.
      # Validations : Sa présence est obligatoire
      t.timestamps

      t.references :administrator, index: true
    end
  end
end
