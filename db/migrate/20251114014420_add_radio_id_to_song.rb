class AddRadioIdToSong < ActiveRecord::Migration[8.0]
  def change
    add_column :songs, :radio_id, :integer
  end
end
