class CreateDirPaths < ActiveRecord::Migration
  def change
    create_table :dir_paths do |t|
      t.string :path, null: false

      t.index :path, unique: true
      t.timestamps null: false
    end
  end
end
