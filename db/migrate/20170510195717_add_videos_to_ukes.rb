class AddVideosToUkes < ActiveRecord::Migration[5.0]
  def change
    add_column :ukuleles, :video, :string
  end
end
