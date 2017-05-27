require 'sinatra/base'
require './lib/player'

class Rps < Sinatra::Base
  enable :sessions

  get '/' do
    erb :index
  end

  post '/login' do
    session[:player] = Player.new(params[:player])
    redirect '/play'
  end

  get '/play' do
    @player = session[:player]
    erb :play
  end

  post '/rock' do
    @player = session[:player]
    @player.draw_rock
    redirect '/play'
  end

  post '/scissors' do
    @player = session[:player]
    @player.draw_scissors
    redirect '/play'
  end

  post '/paper' do
    @player = session[:player]
    @player.draw_paper
    redirect '/play'
  end


end
