class AddQaIdToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :qa_id, :integer
    add_index :bugs, :qa_id
  end
end
