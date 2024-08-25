class RemoveDescriptionFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :description
  end
end
