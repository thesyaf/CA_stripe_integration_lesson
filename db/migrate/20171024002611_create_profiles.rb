class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :avatar_data
      t.string :username
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
