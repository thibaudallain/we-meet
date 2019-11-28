class AddPhotoNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo_number, :string
  end
end
