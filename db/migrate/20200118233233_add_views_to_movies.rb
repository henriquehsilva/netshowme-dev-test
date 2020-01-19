class AddViewsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :views, :int, default: 0
  end
end
