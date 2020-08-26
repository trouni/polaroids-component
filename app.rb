require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require './helpers'

class App < Sinatra::Base
  configure do
    enable :sessions
    set :json_encoder, :to_json
    set :erb, layout: :layout
  end

  before do
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Headers'] = 'accept, authorization, origin'
  end

  options '*' do
    response.headers['Allow'] = 'HEAD,GET,PUT,DELETE,OPTIONS,POST'
    response.headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept'
  end

  get "/" do
    count = params[:count].blank? ? 30 : params[:count].to_i
    @polaroids = (1..count).to_a
    @names = %w(Marc Samir Micky Rob Moe Patrick Jocelyn Yoshiki Doug Yann Sylvain Sasha Trouni Yoshi)
    erb :index
  end
end