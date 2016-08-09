class AddMainImg2ToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :main_img2, :string
  end
end
