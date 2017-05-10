class ChangeUkeValuesToFloat < ActiveRecord::Migration[5.0]
  def up
    change_column :ukuleles, :neck_width, :float
    change_column :ukuleles, :length_scale, :float
    change_column :ukuleles, :length_body, :float
    change_column :ukuleles, :width, :float
    change_column :ukuleles, :depth, :float
  end

  def down
    change_column :ukuleles, :neck_width, :integer
    change_column :ukuleles, :length_scale, :integer
    change_column :ukuleles, :length_body, :integer
    change_column :ukuleles, :width, :integer
    change_column :ukuleles, :depth, :integer
  end
end
