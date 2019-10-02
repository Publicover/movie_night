class Movie < ApplicationRecord

  def self.call_movie(title)
    call_url = "http://www.omdbapi.com/?apikey=#{ENV['OMDB_KEY']}&t=#{title.gsub(' ', '+')}"
    response = HTTParty.get(call_url)
  end
end
