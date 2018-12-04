class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :phone
      t.string :cnpj

      t.timestamps
    end
  end
end
