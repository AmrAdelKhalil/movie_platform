# Creating Movies
harry_potter = Movie.new(name: 'Harry Potter', release_date: Time.now - 2.weeks)
harry_potter.image = Pathname.new("#{Rails.root}/public/harry_potter.jpg").open
harry_potter.save!

jocker = Movie.create(name: 'Jocker', release_date: Time.now)
jocker.image = Pathname.new("#{Rails.root}/public/jocker.jpg").open
jocker.save!


# Creating actors

harry_potter.celebrities << Actor.create(name: Faker::Name.name)
harry_potter.celebrities << Director.create(name: Faker::Name.name)

jocker.celebrities << Actor.create(name: Faker::Name.name)
jocker.celebrities << Director.create(name: Faker::Name.name)

# Creating Awards

jocker.awards << Award.create(name: 'Oscar')

# Create Genres

science_fiction = Genre.create(name: 'Science fiction')
drama = Genre.create(name: 'Drama')

harry_potter.genres << science_fiction

jocker.genres << [drama, science_fiction]

# Creating News

3.times do
  News.create(description: Faker::Lorem.paragraph)
end

# Creating film-rating
g = FilmRating.create(name: 'G')
gp = FilmRating.create(name: 'PG')

harry_potter.film_ratings << g

jocker.film_ratings << gp