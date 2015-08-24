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
    if (!session[:user_id] || !User.exists?(session[:user_id]) ) && !["/login","/signup"].include?(request.path)
      redirect "/login"
    elsif !["/login","/signup"].include?(request.path)
      @user = User.find(session[:user_id])
    end
  end

  # Home page
  get "/" do
    @all_tweets = Tweet.all.limit(50).reverse
    erb :index
  end

  get "/user/:username" do
    @requested_user = User.find_by({username: params[:username]})
    erb :user
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
    if user.save
      session[:user_id] = user.id
      case request_type?
      when :ajax
        body ({
          success: true,
          message: "success", 
          redirect: "/" 
        }.to_json)
      else 
        redirect "/"
      end
    else
      case request_type?
      when :ajax
        status 500
        body({
          success: false, 
          message: error_messages_for(user).to_str
        }.to_json)
      else 
        redirect "/"
      end
    end
  end

  # Login
  get "/login" do
    erb :login
  end

  post '/login' do
    @user = User.find_by({username: params[:username]})
    if @user
      session[:user_id] = @user.id
      case request_type?
      when :ajax
        body({
          success: true, 
          message: "success",
          redirect: "/"
        }.to_json)
      else 
        redirect "/"
      end
    else
      case request_type?
      when :ajax
        status 500
        body({
          success: false, 
          message: "Incorrect username or password"
        }.to_json)
      else 
        redirect "/login"
      end
    end
  end

  # Logout
  post '/logout' do
    session.destroy
    redirect "/"
  end

  # Helpers
  def error_messages_for(object)
    all_errors = ""
    for error in object.errors.messages do
      key = error.first.to_s.capitalize
      what_is_wrong = error.second.join(' and ')
      all_errors += "#{key} #{what_is_wrong}.\n"
    end
    all_errors
  end

  def request_type?
    return :ajax    if request.xhr?
    return :normal
  end
end