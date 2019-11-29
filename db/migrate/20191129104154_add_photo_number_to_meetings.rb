class AddPhotoNumberToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :photo_number, :string
  end
end
