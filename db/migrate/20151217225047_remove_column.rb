class RemoveColumn < ActiveRecord::Migration
  def change
  	remove_column :jobs, :url
  end
end
