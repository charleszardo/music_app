# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def generate_lyrics
  lines = rand(3..12)
  lyrics = Faker::Hipster.paragraph(lines)
  lyrics.split(". ").map { |line| line += "\r\n"}.join("").strip
end

user = User.create(email: "admin", password: "123456", admin: true)

5.times do
  band_name = Faker::Superhero.name
  band = Band.create(name: band_name, user_id: user.id)

  3.times do
    album_title = Faker::Space.nebula
    album = Album.create(title: album_title, band_id: band.id, album_type: "studio")

    10.times do
      track_title = Faker::Hipster.sentence
      lyrics = generate_lyrics
      track = Track.create(title: track_title, album_id: album.id, track_type: "regular", lyrics: lyrics)
    end
  end
end
