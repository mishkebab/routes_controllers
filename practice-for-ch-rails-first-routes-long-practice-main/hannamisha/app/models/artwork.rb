# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  favorited  :boolean
#
class Artwork < ApplicationRecord
    validates :title, :artist_id, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :title, uniqueness: { scope: :artist_id }

    belongs_to :artist,
    foreign_key: :artist_id,
    class_name: :User

    has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

    has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer

    has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy

    def self.artworks_for_user_id(user_id)
        Artwork
            .select('artworks.*')
            .joins(:shared_viewers)
            .joins(:artist)
            .where("users.id = ?", user_id)
    end

    def self.favorites
        Artwork
            .select('artworks.*')
            .where('artworks.favorited = ?', true)
    end

    has_many :likes, as: :likeable

end 
