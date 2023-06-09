# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#
class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy,
    inverse_of: :artist

    has_many :artwork_shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy,
    inverse_of: :viewer

    has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

    has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment,
    dependent: :destroy,
    inverse_of: :author

    has_many :likes,
    foreign_key: :liker_id,
    class_name: :Like,
    dependent: :destroy,
    inverse_of: :liker

    def self.query(name)
        User
            .select('users.*')
            .where('users.username = ?', name)
    end 
end 

