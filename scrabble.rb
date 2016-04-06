require 'sinatra'
require_relative 'lib/scoring'

class ScrabbleApp < Sinatra::Base

  get '/' do
    erb :"home-page"
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @score = Scoring.score(params["word"])
    # @score.score
    erb :score
  end

run!
end
