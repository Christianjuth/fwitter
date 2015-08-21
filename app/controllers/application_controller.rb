# Set environment
require "./config/environment"

# Get models
require "./app/models/user"
require "./app/models/tweet"
require "./app/models/hashtag"
require "./app/models/tweets_hashtag"

# Set routs
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "flatiron"
  end

  # If loged in
  before do
    if !session[:user_id] && !["/login","/signup"].include?(request.path)
      redirect "/login"
    elsif !["/login","/signup"].include?(request.path)
      @user = User.find(session[:user_id])
    end
  end

  # Home page
  get "/" do
    @all_tweets = Tweet.all.reverse
    @all_users  = User.all
    erb :index
  end

  # Post to Fwitter
  post '/new_tweet' do
    tweet = Tweet.new({
      user_id: @user.id,
      msg: params[:msg]
    })
    tweet.save
    redirect '/'
  end

  # User sign up
  get "/signup" do
    erb :signup
  end

  post '/signup' do
    user = User.new({
      username: params[:username],
      email:    params[:email],
      hashed_password: params[:password],
    })
    user.save
    session[:user_id] = user.id
    redirect '/'
  end

  # Login
  get "/login" do
    erb :login
  end

  post '/login' do
    @user = User.find_by({username: params[:username]})
    unless session[:user_id]
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect "/login"
    end
  end

  # Logout
  post '/logout' do
    session[:user_id] = nil
    redirect "/"
  end
end