class AddMainImg3ToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :main_img3, :string
  end
end
