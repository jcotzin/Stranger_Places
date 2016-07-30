class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.string :city
      t.string :state_province
      t.string :country

      t.timestamps
    end
  end
end
