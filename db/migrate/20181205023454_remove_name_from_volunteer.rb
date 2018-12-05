class RemoveNameFromVolunteer < ActiveRecord::Migration[5.2]
  def change
    remove_column :volunteers, :name, :string
  end
end
