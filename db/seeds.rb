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

def generate_band(user)
  band_name = Faker::Superhero.name
  Band.create(name: band_name, user_id: user.id)
end

def generate_album(band)
  album_title = Faker::Space.nebula
  Album.create(title: album_title, band_id: band.id, album_type: "studio")
end

def generate_track(album)
  track_title = Faker::Hipster.sentence
  lyrics = generate_lyrics
  Track.create(title: track_title, album_id: album.id, track_type: "regular", lyrics: lyrics)
end

user = User.create(email: "admin", password: "123456", admin: true)

5.times do
  band = generate_band(user)
  3.times do
    album = generate_album(band)
    10.times do
      generate_track(album)
    end
  end
end
