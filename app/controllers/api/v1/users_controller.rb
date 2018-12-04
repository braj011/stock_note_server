class Api::V1::UsersController < ApplicationController

  def index
    render json:User.all
  end

  def show
    user = get_current_user
    if user 
        # render json: user  # may want to render: [ user, user.stocks ]
        render json: user.user_stocks, serializer: UserStockSerializer
    else 
        render json: {error: 'You are not signed in.'}
    end 
  end

  def login
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        render json: {email: user.email, firstName: user.first_name, userID: user.id, token: issue_token({id: user.id})}
        # render json: user, serializer: AuthSerializer  - CAN DO THIS LATEWR FOR REFACTORING
    else
        render json: {error: 'Invalid email/password combination.'}, status: 400
    end
  end

  def validate
    user = get_current_user
    if user
      render json: {email: user.email, firstName: user.first_name, userID: user.id, token: issue_token({id: user.id})}
    else
      render json: {error: 'User not found.'}, status: 400
    end
  end

  def signup
    user = User.new(first_name: params[:firstName], email: params[:email], password: params[:password])

    if user.valid?
        # SOMETHING TO CONSIDER FOR STOCKS .... CategoryUser.create(category_id: 1, user_id: user.id)
        user.save
        puts user
        render json: {firstName: user.first_name, email: user.email, userID: user.id, token: issue_token({id: user.id})}
    else
        render json: {error: 'Incorrect details or email address already taken'}, status: 400
    end
  end

end
