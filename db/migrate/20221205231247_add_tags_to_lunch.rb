class AddTagsToLunch < ActiveRecord::Migration[7.0]
  def change
    add_column :lunches, :tags, :string, array: true
  end
end
