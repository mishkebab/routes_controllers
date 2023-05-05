class FavoriteColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :favorited, :boolean
    add_column :artwork_shares, :favorited, :boolean
  end
end
