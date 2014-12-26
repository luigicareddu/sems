class ChangeNoteName < ActiveRecord::Migration
  def change
  	rename_column :notes, :text, :title
  end
end
