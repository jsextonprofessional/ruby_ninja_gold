Rails.application.routes.draw do

  get "/" => "rpgs#index"
  post "/handler" => "rpgs#handler"
  # get "/reloader" => "repgs#reloader"

end
