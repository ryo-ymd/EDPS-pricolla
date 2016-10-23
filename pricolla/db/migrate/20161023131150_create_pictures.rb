class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.string :name
      t.integer :user_id
      t.integer :type

      t.timestamps
    end
  end
end
