class AddInvalidateCloudfrontToDirPath < ActiveRecord::Migration
  def change
    add_column :dir_paths, :invalidate_cloudfront, :boolean, default: false, null: false
  end
end
