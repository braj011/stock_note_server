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
    @note = Note.create(title: params[:title], content: params[:content], article_url: params[:article_url], user_stock_id: user_stock.id)

    NoteReminderJob.perform_later(@note, '3rd Dec 2018 17:18:20')

    # set(wait_until: DateTime.parse('3rd Dec 2018 16:46:10')).perform_later(@note) 
    
    # https://blog.codeship.com/how-to-use-rails-active-job/

    render json: { title: @note.title, content: @note.content, article_url: @note.article_url, user_stock_id: @note.user_stock_id, updated_at: @note.updated_at }
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
