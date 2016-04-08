require 'sinatra'
require_relative 'lib/scoring'

class ScrabbleApp < Sinatra::Base

  get '/' do
    erb :'home-page'
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @word = params["word"]
    @score = Scoring.score(params["word"])
    erb :score
  end


  get '/score-many' do
    erb :'score-many'
  end

  post '/score-many' do
    @number = params["number"]
    @words_array = params["all_words"]

    if @words_array
      @scoring_hash = {}
      @words_array.each do |word|
        @scoring_hash[word] = Scoring.score(word)
      end
    end

    erb :'score-many'
  end

run!
end
