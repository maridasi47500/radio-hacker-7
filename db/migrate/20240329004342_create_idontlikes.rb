class CreateIdontlikes < ActiveRecord::Migration[6.0]
  def change
    create_table :idontlikes do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
