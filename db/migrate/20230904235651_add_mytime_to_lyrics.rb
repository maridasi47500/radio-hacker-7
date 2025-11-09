class AddMytimeToLyrics < ActiveRecord::Migration[6.0]
  def change
    add_column :lyrics, :mytime, :time
  end
end
