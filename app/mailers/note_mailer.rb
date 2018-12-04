class NoteMailer < ApplicationMailer

  def new_note_created(note)
    @user = note.user_stock.user
    @specialtext = "Hello #{@user.first_name}, stock alert for #{note.user_stock.stock.name}"
    mail(to: @user.email, subject: @specialtext, body: ["Content  ", note.content, "  article url: ", note.article_url] )
      # .tap do |message|
      # message.mailgun_options = {
      #   "tag" => ["test-mailgun1", "approx 12 pm Monday"],
      #   "tracking-opens" => true,
      #   "tracking-clicks" => "htmlonly"
      # }
      # end 
  end

  #  see message_tenant example from https://medium.com/@dflores_89085/using-actionmailer-with-react-redux-822e0b575dc3

end
