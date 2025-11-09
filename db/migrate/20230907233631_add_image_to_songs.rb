class AddImageToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :image, :string
  end
end
