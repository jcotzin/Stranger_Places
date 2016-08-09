class AddVideoToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :video, :string
  end
end
