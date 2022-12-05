class CreateLunches < ActiveRecord::Migration[7.0]
  def change
    create_table :lunches do |t|
      t.date :cooking_date
      t.string :title
      t.text :description
      t.string :tags
      t.string :recipe_url
      t.references :user, null: false, foreign_key: true
      t.references :usergroup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
