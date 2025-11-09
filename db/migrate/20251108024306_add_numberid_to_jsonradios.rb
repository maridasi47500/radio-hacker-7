class AddNumberidToJsonradios < ActiveRecord::Migration[8.0]
  def change
    add_column :jsonradios, :numberid, :integer
  end
end
