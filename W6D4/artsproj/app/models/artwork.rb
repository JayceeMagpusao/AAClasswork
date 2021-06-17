# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id},
        presence: true
        

    validates :image_url,
        presence: true,
        uniqueness: :true

    belongs_to :user,
        foreign_key: :artist_id,
        class_name: :User

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :Artwork_share
    
    has_many :shared_viewers,
        through: :artworks_shares,
        source: :viewer

end
