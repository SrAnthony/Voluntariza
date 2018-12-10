class AddNameToVolunteer < ActiveRecord::Migration[5.2]
  def change
    add_column :volunteers, :name, :string
  end
end
