# Set environment
require "./config/environment"

# Get models
require "./app/models/user"
require "./app/models/tweet"

# Set routs
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
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
      user_id: params[:user_id],
      msg: params[:msg]
    })
    tweet.save
    redirect '/'
  end

  # User sign up
  get "/sign_up" do
    erb :sign_up
  end

  post '/sign_up' do
    user = User.new({
      username: params[:username],
      email:    params[:email],
      password: params[:password],
    })
    user.save
    redirect '/'
  end
end
