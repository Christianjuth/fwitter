# Set environment
require "./config/environment"

# Get models
require "./app/models/tweet"

# Set routs
class ApplicationControler < Sinatra::Base
  register Mustache::Sinatra


  set :mustache, {
    templates: "./app/templates",
    views: "./app/views"
  }

  # configure do
  #   set :public_folder, "public"
  #   set :views, "app/views"
  # end

  get "/" do
    @title = "YOLO"
    # Tweet.new("Jim", "Hello I'm a Steelers fan!")
    # Tweet.new("Christian", "YOLO")
    # @tweets = Tweet.all
    mustache :index
  end
end