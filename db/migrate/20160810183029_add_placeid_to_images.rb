class AddPlaceidToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :place_id, :string
  end
end
