class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :name
      t.date :birth_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
