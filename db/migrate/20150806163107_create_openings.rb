class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.string :title
      t.string :req_id
      t.string :country
      t.string :sector
      t.string :apply_date
      t.string :start_date

      t.timestamps null: false
    end
  end
end
