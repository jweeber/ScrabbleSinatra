require 'sinatra'
require_relative 'lib/scoring'
require 'pry' # used pry for some debugging

class ScrabbleApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @word = params["word"]
    @score = Scoring.score(params["word"])
    @points = Scoring::SCORES
    @bonus = Scoring::BONUS if @word.length == 7
    @error = ""
    erb :score
  end

  get '/score/:word' do
    @word = params["word"]
    @error = ""
    if /[a-zA-Z]/.match(@word) && @word.length >= 2 && @word.length <= 7
      @score = Scoring.score(@word)
      @points = Scoring::SCORES
      @bonus = Scoring::BONUS if @word.length == 7
    else
      @error = "You can only enter 2-7 letters!"
    end
    erb :score
  end

  get '/score-many' do
    erb :'score-many'
  end

  post '/score-many' do
    @number = params["number"]
    @words_array = params["all_words"]
    @points = Scoring::SCORES

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
