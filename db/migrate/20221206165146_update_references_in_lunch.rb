class UpdateReferencesInLunch < ActiveRecord::Migration[7.0]
  def change
    remove_reference :lunches, :usergroup, foreign_key: true
    add_reference :lunches, :group, foreign_key: true
  end
end
