class AddNicknameToUkulele < ActiveRecord::Migration[5.0]
  def change
    add_column :ukuleles, :nickname, :string
  end
end
