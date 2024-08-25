class AddScreenshotToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :screenshot, :string
  end
end
