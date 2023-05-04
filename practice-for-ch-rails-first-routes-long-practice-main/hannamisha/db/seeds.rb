# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Destroying tables..."

  Like.destroy_all
  Comment.destroy_all
  ArtworkShare.destroy_all
  Artwork.destroy_all
  User.destroy_all
  
  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ["users", "artworks", "artwork_shares", "comments", "likes"].each do |table_name|
    ApplicationRecord.connection.reset_pk_sequence!(table_name)
  end

  puts "Creating users..."

User.create(username: "hanna")
User.create(username: "misha")
User.create(username: "da vinci")
User.create(username: "thomas")

Artwork.create(title: "mona lisa", image_url: "mona lisa url", artist_id: 3, favorited: true)
Artwork.create(title: "beautiful ruby", image_url: "beautiful ruby url", artist_id: 2, favorited: true)
Artwork.create(title: "bananable", image_url: "bananable url", artist_id: 1, favorited: false)

ArtworkShare.create(artwork_id: 1, viewer_id: 4, favorited: true)
ArtworkShare.create(artwork_id: 1, viewer_id: 2, favorited: false)
ArtworkShare.create(artwork_id: 2, viewer_id: 1, favorited: true)
ArtworkShare.create(artwork_id: 3, viewer_id: 4, favorited: false)
ArtworkShare.create(artwork_id: 1, viewer_id: 3, favorited: true)

Comment.create(body: "i dont get the hype", artwork_id: 1, author_id: 4)
Comment.create(body: "FIRST", artwork_id: 1, author_id: 2)
Comment.create(body: "bananas slap", artwork_id: 3, author_id: 2)
Comment.create(body: "she's a beaut", artwork_id: 2, author_id: 1)

Like.create(liker_id:1, likeable_type: Comment, likeable_id: 1)
Like.create(liker_id:1, likeable_type: Artwork, likeable_id: 1)
Like.create(liker_id:2, likeable_type: Comment, likeable_id: 2)
Like.create(liker_id:2, likeable_type: Artwork, likeable_id: 2)