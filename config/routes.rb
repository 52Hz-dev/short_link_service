Rails.application.routes.draw do
  post '/encode', to: 'urls#encode'
  post '/decode', to: 'urls#decode'
end
