class Artwork < ApplicationRecord
    validates :title, :artist_id
        presence: true,
        uniqueness: true

    validates :image_url,
        presence: true,
        uniqueness: :true

    belongs_to :user,
        foreign_key: :artist_id,
        class_name: :User
end