class Api::V1::NotesController < ApplicationController

  def index 
    render json: Note.all
  end 

  def show
    @stock_note = Note.find(params[:id])
    render json: @stock_note
  end

  def new 
    @note = Note.new
  end 


  def create
    user_stock = UserStock.find_by(user_id: get_current_user.id, stock_id: params[:stock_id].to_i)
    @note = Note.create(title: params[:title], content: params[:content], article_url: params[:article_url], 
            notif_date: params[:notif_date], user_stock_id: user_stock.id)
    formatted_Date = @note.notif_date.to_datetime 
    NoteReminderJob.perform_later(@note, params[:notif_date])  # this works - 5th Dec 11 am   # '5th Dec 2018 11:25:15'
    render json: { title: @note.title, content: @note.content, article_url: @note.article_url, notif_date: @note.notif_date,  user_stock_id: @note.user_stock_id, updated_at: @note.updated_at }

    # @date = DateTime.parse('4th Dec 2018 16:56:20')
    # NoteReminderJob.perform_later(@note, @date) 
    # https://blog.codeship.com/how-to-use-rails-active-job/

    # if note.valid?
    #   note.save
    # else 
    #   # note.errors.full_messages.each do |msg| puts msg end
    #   render json: nil
    # end 
  end

  def get_user_notes 
    user_stock = UserStock.find_by(user_id: get_current_user.id, stock_id: params[:stock_id].to_i)
    render json: user_stock.notes 
    
    #  - DON"T NEED TO DO THIS ANYMORE - sorted ordering in client side - .sort_by { |note| note.updated_at }.reverse
  end 

end
