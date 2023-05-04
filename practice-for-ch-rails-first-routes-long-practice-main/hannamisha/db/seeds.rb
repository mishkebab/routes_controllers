# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying tables..."

  User.destroy_all
  Artwork.destroy_all
  ArtworkShare.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ["users", "artworks", "artwork_shares"].each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts "Creating users..."

User.create(username: "hanna")
User.create(username: "misha")
User.create(username: "da vinci")
User.create(username: "thomas")

Artwork.create(title: "mona lisa", image_url: "mona lisa url", artist_id: 3)
Artwork.create(title: "beautiful ruby", image_url: "beautiful ruby url", artist_id: 2)
Artwork.create(title: "bananable", image_url: "bananable url", artist_id: 1)

ArtworkShare.create(artwork_id: 1, viewer_id: 4)
ArtworkShare.create(artwork_id: 1, viewer_id: 2)
ArtworkShare.create(artwork_id: 2, viewer_id: 1)
ArtworkShare.create(artwork_id: 3, viewer_id: 4)
ArtworkShare.create(artwork_id: 1, viewer_id: 3)
