# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

welcome = Movie.where(title: 'Honest Thief').first
welcome.delete if welcome

movies = Movie.create(title:"Honest Thief", director: "Mark Williams", genre: "Action", duration: 99, country: "USA", release_date: Date.new(2020,11,12), poster: "https://m.media-amazon.com/images/M/MV5BZjEwNjYyMTMtODc5Yi00NTg5LTkwMzAtZTkyOTcyNTFkMGIyXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UX182_CR0,0,182,268_AL_.jpg", summary: "This is the movie summary")
movies = Movie.create(title:"Movie 2", director: "Mark Williams", genre: "Action", duration: 99, country: "USA", release_date: Date.new(2020,11,12), poster: "https://m.media-amazon.com/images/M/MV5BZjEwNjYyMTMtODc5Yi00NTg5LTkwMzAtZTkyOTcyNTFkMGIyXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UX182_CR0,0,182,268_AL_.jpg", summary: "This is the movie summary")
movies = Movie.create(title:"Movie 3", director: "Mark Williams", genre: "Action", duration: 99, country: "USA", release_date: Date.new(2020,11,12), poster: "https://m.media-amazon.com/images/M/MV5BZjEwNjYyMTMtODc5Yi00NTg5LTkwMzAtZTkyOTcyNTFkMGIyXkEyXkFqcGdeQXVyMDA4NzMyOA@@._V1_UX182_CR0,0,182,268_AL_.jpg", summary: "This is the movie summary")
