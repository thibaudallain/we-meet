class AddVotedToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :voted, :boolean
  end
end
