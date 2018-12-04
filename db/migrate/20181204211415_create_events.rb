class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
