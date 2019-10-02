class AddFieldsToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :year, :string
    add_column :movies, :rated, :string
    add_column :movies, :released, :string
    add_column :movies, :runtime, :string
    add_column :movies, :genre, :string
    add_column :movies, :director, :string
    add_column :movies, :writer, :string
    add_column :movies, :actors, :string
    add_column :movies, :plot, :string
    add_column :movies, :country, :string
    add_column :movies, :awards, :string
    add_column :movies, :poster, :string
    add_column :movies, :imdb, :string
    add_column :movies, :rotten_tomatoes, :string
    add_column :movies, :metacritic, :string
    add_column :movies, :metascore, :string
    add_column :movies, :imdbrating, :string
    add_column :movies, :imdbvotes, :string
    add_column :movies, :imdbid, :string
    add_column :movies, :box_office, :string
    add_column :movies, :production, :string
    add_column :movies, :website, :string
  end
end
