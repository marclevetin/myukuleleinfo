class AddPhotosToUkuleles < ActiveRecord::Migration[5.0]
  def change
    add_column :ukuleles, :photos, :json
  end
end
