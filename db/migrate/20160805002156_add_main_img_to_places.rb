class AddMainImgToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :main_img, :string
  end
end
