class AddAvailableTimeToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :available_time, :string
  end
end
