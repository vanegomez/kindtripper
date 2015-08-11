class CreateUserOpenings < ActiveRecord::Migration
  def change
    create_table :user_openings do |t|
      t.references :user, index: true, foreign_key: true
      t.references :opening, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
