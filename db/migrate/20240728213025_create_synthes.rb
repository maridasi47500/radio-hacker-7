class CreateSynthes < ActiveRecord::Migration[6.0]
  def change
    create_table :synthes do |t|
      t.integer :song_id

      t.timestamps
    end
  end
end
