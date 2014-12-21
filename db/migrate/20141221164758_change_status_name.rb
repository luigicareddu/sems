class ChangeStatusName < ActiveRecord::Migration
  def change
  	rename_column :planes, :status, :state
  end
end
