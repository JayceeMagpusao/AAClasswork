# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do

    Artwork_share.destroy_all
    Artwork.destroy_all
    User.destroy_all

    #Artists
    artist1 = User.create!({username: "artist1"})
    artist2 = User.create!({username: "artist2"})
    artist3 = User.create!({username: "artist3"})


    #Viewers
    viewer1 = User.create!({username: "viewer1"})
    viewer2 = User.create!({username: "viewer2"})
    viewer3 = User.create!({username: "viewer3"})
 

    #Artwork
    artwork1 = Artwork.create!({title: "Masterpiece", image_url: "maspeace.com", artist_id: artist1.id})
    artwork2 = Artwork.create!({title: "Mona Lisa", image_url: "monalisa.com", artist_id: artist2.id})
    artwork3 = Artwork.create!({title: "Crayon Drawing", image_url: "crayon.com", artist_id: artist3.id})
    artwork4 = Artwork.create!({title: "Pier", image_url: "pier.com", artist_id: artist3.id})
    artwork5 = Artwork.create!({title: "Big Sur", image_url: "bigsur.com", artist_id: artist1.id})
    artwork6 = Artwork.create!({title: "Birds", image_url: "birds.com", artist_id: artist2.id})
  
    
    #Artwork Shares
    artwork_share1 = Artwork_share.create!({artwork_id: artwork1.id, viewer_id: viewer1.id})
    artwork_share2 = Artwork_share.create!({artwork_id: artwork3.id, viewer_id: viewer2.id})
    artwork_share3 = Artwork_share.create!({artwork_id: artwork4.id, viewer_id: viewer2.id})
    artwork_share4 = Artwork_share.create!({artwork_id: artwork5.id, viewer_id: viewer3.id})
    artwork_share5 = Artwork_share.create!({artwork_id: artwork6.id, viewer_id: viewer3.id})
    artwork_share6 = Artwork_share.create!({artwork_id: artwork2.id, viewer_id: viewer1.id})

end