class AddAirportToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :airport, :string
  end
end
