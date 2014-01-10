class AddImageToFarms < ActiveRecord::Migration
  def self.up
    add_attachment :farms, :image
  end

  def self.down
    remove_attachment :farms, :image
  end
end
