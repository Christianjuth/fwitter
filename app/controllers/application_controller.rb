# Set environment
require "./config/environment"

# Get models
require "./app/models/tweet"

# Set routs
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
  end

  # Home page
  get "/" do
    @all_tweets = Tweet.all
    erb :index
  end

  # Post to Fwitter
  post '/new_tweet' do
    tweet = Tweet.new({
      username: params[:username],
      msg: params[:msg]
    })
    tweet.save
    redirect '/'
  end
end
