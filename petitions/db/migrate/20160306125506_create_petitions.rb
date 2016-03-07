class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :text

      t.timestamps null: false
    end
  end
end
