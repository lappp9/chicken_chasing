class AddPhotoUrlToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :photo_url, :string
  end
end
