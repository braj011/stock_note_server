class AddNotifDateToNotes < ActiveRecord::Migration[5.2]
  def change
    add_column :notes, :notif_date, :datetime
  end
end
