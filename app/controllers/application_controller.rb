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

  get "/" do
    @tweet = Tweet.new("Jim", "Hello I'm a Steelers fan!")
    @tweet = Tweet.new("Christian", "YOLO")
    @all_tweets = Tweet.all
    erb :index
  end
end