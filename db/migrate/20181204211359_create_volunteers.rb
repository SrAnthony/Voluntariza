class CreateVolunteers < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :phone
      t.string :cpf

      t.timestamps
    end
  end
end
