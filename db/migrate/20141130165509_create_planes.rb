class CreatePlanes < ActiveRecord::Migration
  def change
    create_table :planes do |t|
      t.string :ac_type
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
