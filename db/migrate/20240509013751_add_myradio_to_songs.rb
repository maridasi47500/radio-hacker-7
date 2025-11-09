class AddMyradioToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :myradio, :string
  end
end
