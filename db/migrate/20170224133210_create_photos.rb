class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :one_liner
      t.text :description

      t.timestamps null: false
    end
  end
end
