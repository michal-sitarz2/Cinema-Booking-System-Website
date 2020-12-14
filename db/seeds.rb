# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#


# ! WARNING: if this file is run, all the screenings, users and bookings get deleted

# Destroys all the users and their corresponding bookings
User.destroy_all

#Clearing the database from Screenings
Screening.destroy_all

# Checking if the initial admin is already in the database
adminDb = User.where(email: 'admin@gmail.com').first
# Deleted if found
adminDb.delete if adminDb

# Creating and saving a user model which will be the admin for the page with access to all the resources
admin = User.new(:email => 'admin@gmail.com', :password => 'admin123', :password_confirmation => 'admin123', :admin => true)
admin.save

#   +-----------------------------------+
#  |           Movies                  |
# +-----------------------------------+

# Movie 1 - Released
# Checking if the movie is already in the database
movie = Movie.where(title: 'Honest Thief').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie1 = Movie.create(title:"Honest Thief", director: "Mark Williams", genre: "Action", duration: 99, country: "USA", release_date: Date.new(2020,11,12), poster: "https://www.joblo.com/assets/images/joblo/posters/2020/07/honesttheifposterman.jpg", summary: "Hoping to cut a deal, a professional bank robber agrees to return all the money he stole in exchange for a reduced sentence. But when two FBI agents set him up for murder, he must now go on the run to clear his name and bring them to justice.", actors: "Liam Neeson, Kate Walsh, Jai Courtney", video: "https://www.youtube.com/embed/jG1X67vnYM0", restrictions: "PG-13")
movie1.save

# Movie 2 - Released
# Checking if the movie is already in the database
movie = Movie.where(title: 'Tenet').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie2 = Movie.create(title:"Tenet", director: "Christopher Nolan", genre: "Action, Thriller", duration: 150, country: "USA", release_date: Date.new(2020,8,27), poster: "https://www.rollingstone.com/wp-content/uploads/2020/08/tenet2020_Nolan-movie-poster.jpg", summary: "A secret agent embarks on a dangerous, time-bending mission to prevent the start of World War III.", actors: "John David Washington, Robert Pattison, Elizabeth Debicki, Kenneth Baranagh", video: "https://www.youtube.com/embed/L3pk_TBkihU", restrictions: "PG-13")
movie2.save

# Movie 3 - Released
# Checking if the movie is already in the database
movie = Movie.where(title: 'Greenland').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie3 = Movie.create(title:"Greenland", director: "Ric Roman Waugh", genre: "Action", duration: 119, country: "USA", release_date: Date.new(2020,10,1), poster: "https://www.cinema-city.pl/xmedia-cw/repo/feats/posters/4125S2R-lg.jpg", summary: "John Garrity, his estranged wife and their young son embark on a perilous journey to find sanctuary as a planet-killing comet hurtles toward Earth. Amid terrifying accounts of cities getting leveled, the Garrity's experience the best and worst in humanity. As the countdown to the global apocalypse approaches zero, their incredible trek culminates in a desperate and last-minute flight to a possible safe haven.", actors: "Gerard Butler, Morena Baccarin", video: "https://www.youtube.com/embed/1M8s0w1Fzm4", restrictions: "PG-13")
movie3.save

#

# Movie 4 - Upcoming
# Checking if the movie is already in the database
movie = Movie.where(title: 'Monster Hunter').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie4 = Movie.create(title:"Monster Hunter", director: "Paul Anderson", genre: "Action, Fantasy", duration: 120, country: "USA", release_date: Date.new(2020,12,25), poster: "https://www.cinema-city.pl/xmedia-cw/repo/feats/posters/4078S2R-lg.jpg", summary: "A portal transports Lt. Artemis and an elite unit of soldiers to a strange world where powerful monsters rule with deadly ferocity. Faced with relentless danger, the team encounters a mysterious hunter who may be its only hope to find a way home.", actors: "Milla Jovovich, Ron Perlman, Tony Jaa", video: "https://www.youtube.com/embed/3od-kQMTZ9M", restrictions: "PG-13")
movie4.save

# Movie 5 - Upcoming
# Checking if the movie is already in the database
movie = Movie.where(title: 'Death on the Nile').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie5 = Movie.create(title:"Death on the Nile", director: "Kenneth Branagh", genre: "Criminal, Drama, Mystery", duration: 127, country: "USA", release_date: Date.new(2020,12,18), poster: "https://www.cinema-city.pl/xmedia-cw/repo/feats/posters/4254S2R-lg.jpg", summary: "Detective Hercule Poirot investigates the murder of a young heiress aboard a cruise ship on the Nile River.", actors: "Kenneth Baranagh, Gal Gadot, Annette Bening, Armie Hammer", video: "https://www.youtube.com/embed/RIyKutoFLOU", restrictions: "N/A")
movie5.save

# Movie 6 - Upcoming
# Checking if the movie is already in the database
movie = Movie.where(title: 'No Time to Die').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie6 = Movie.create(title:"No Time to Die", director: "Cary Foji Fukunaga", genre: "Action", duration: 165, country: "USA", release_date: Date.new(2021,4,2), poster: "https://www.cinema-city.pl/xmedia-cw/repo/feats/posters/3818S2R-lg.jpg", summary: "Recruited to rescue a kidnapped scientist, globe-trotting spy James Bond finds himself hot on the trail of a mysterious villain who's armed with a dangerous new technology.", actors: "Daniel Craig, Rami Malek, Ralph Fiennes", video: "https://www.youtube.com/embed/vw2FOYjCz38", restrictions: "PG-13")
movie6.save

# Movie 7 - Upcoming
# Checking if the movie is already in the database
movie = Movie.where(title: 'Peter Rabbit 2: The Runaway').first
# Deleted if found
movie.delete if movie
# Creating and saving a movie
movie7 = Movie.create(title:"Peter Rabbit 2: The Runaway", director: "Will Gluck", genre: "Fantasy, Adventure, Kids and Family, Comedy", duration: 93, country: "USA", release_date: Date.new(2021,4,2), poster: "https://images-na.ssl-images-amazon.com/images/I/51mGDGPluDL._AC_.jpg", summary: "Unable to stay out of trouble, Peter Rabbit embarks on a series of adventures with a new bunny friend who knew his father.", actors: "James Corden, Domhnall Gleeson, Margot Robbie, Elizabeth Debicki", video: "https://www.youtube.com/embed/0ori_vkgsSA", restrictions: "N/A")
movie7.save


#   +-----------------------------------+
#  |          Cinemas                  |
# +-----------------------------------+
cinema1 = Cinema.where(name: 'ODEON BFI IMAX').first
cinema1.delete if cinema1
cinema1 = Cinema.create(name:"ODEON BFI IMAX", address:"1 Charlie Chaplin Walk, South Bank, Waterloo SE1 8XR", image: "https://odeonevents.co.uk/wp-content/uploads/2017/11/Artboard-2-Copy-3.jpg")
cinema1.save

cinema2 = Cinema.where(name: 'ODEON Guildford').first
cinema2.delete if cinema2
cinema2 = Cinema.create(name:"ODEON Guildford", address:"Bedford Rd, Guildford GU1 4SJ", image: "https://odeonevents.co.uk/wp-content/uploads/2017/12/YPS3854.jpg")
cinema2.save


#   +-----------------------------------+
#  |          Screenings               |
# +-----------------------------------+

# Screenings for Movie 1 in Cinema 1
# Creates Screenings for the entire week at the same time and with same attributes
i = 0
loop do
  screening = Screening.create(movie_id: movie1.id, cinema: cinema1.name, arena: "2", price: 5.99, screening_time: "18:00", screening_date: Date.today+i, available_seats: 60, screening_type: "2D")
  screening.save
  i += 1
  if i == 7
    break
  end
end

# Screenings for Movie 1 in Cinema 2
# Creates Screenings for the entire week at the same time and with same attributes
i = 0
loop do
  screening = Screening.create(movie_id: movie1.id, cinema: cinema2.name, arena: "22", price: 5.99, screening_time: "19:00", screening_date: Date.today+i, available_seats: 60, screening_type: "2D")
  screening.save
  i += 1
  if i == 7
    break
  end
end

# Screenings for Movie 2 in Cinema 1
# Creates Screenings for the whole week in 2D
i = 0
loop do
  screening = Screening.create(movie_id: movie2.id, cinema: cinema1.name, arena: "3", price: 6.99, screening_time: "18:30", screening_date: Date.today+i, available_seats: 60, screening_type: "2D")
  screening.save
  i += 1
  if i == 6
    break
  end
end

# Screenings for Movie 2 in Cinema 1
# Creates Screenings for every second day of the week in 3D
i = 1
loop do
  screening = Screening.create(movie_id: movie2.id, cinema: cinema1.name, arena: "3", price: 5.99, screening_time: "19:00", screening_date: Date.today+i, available_seats: 60, screening_type: "3D")
  screening.save
  i += 2
  if i == 5
    break
  end
end

# Screenings for Movie 2 in Cinema 2
# Creates Screenings for the entire week at the same time and with same attributes
i = 0
loop do
  screening = Screening.create(movie_id: movie2.id, cinema: cinema2.name, arena: "13", price: 5.99, screening_time: "20:45", screening_date: Date.today+i, available_seats: 60, screening_type: "2D")
  screening.save
  i += 1
  if i == 7
    break
  end
end

# Screenings for Movie 3 in Cinema 1
# Creates Screenings for the entire week at the same time and with same attributes
i = 0
loop do
  screening = Screening.create(movie_id: movie3.id, cinema: cinema1.name, arena: "4", price: 4.99, screening_time: "20:00", screening_date: Date.today+i, available_seats: 50, screening_type: "2D")
  screening.save
  i += 1
  if i == 7
    break
  end
end

# Screenings for Movie 3 in Cinema 2
# Creates Screenings for the entire week at the same time and with same attributes
i = 0
loop do
  screening = Screening.create(movie_id: movie3.id, cinema: cinema2.name, arena: "14", price: 4.99, screening_time: "19:15", screening_date: Date.today+i, available_seats: 50, screening_type: "2D")
  screening.save
  i += 1
  if i == 7
    break
  end
end
