class NoteReminderJob < ApplicationJob
  queue_as :default

  

  def perform(note, date)
    x = NoteMailer.new_note_created(note).deliver_later( wait_until: DateTime.parse(date))
    puts ("- - - - - JOB DONE..? - - - - - - #{x}")
  end
end
