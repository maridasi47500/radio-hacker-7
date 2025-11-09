class CreateRssradios < ActiveRecord::Migration[6.0]
  def change
    create_table :rssradios do |t|
      t.string :name
      t.string :pic
      t.string :stream
      t.string :mysong
      t.string :mytime

      t.timestamps
    end
  end
end
