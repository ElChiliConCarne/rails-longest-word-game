require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @score = 0
    @word = params[:word]
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    parsed_response = JSON.parse(response)
    @ok = parsed_response["found"]

    if @ok
      @result = "That's a good one"
    else
      @result = "You are wrong"
    end
  end
end
