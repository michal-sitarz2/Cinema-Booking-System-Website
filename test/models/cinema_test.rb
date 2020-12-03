require 'test_helper'

class CinemaTest < ActiveSupport::TestCase

  test 'should save valid cinema' do
    cinema = Cinema.create(name:"cinemaName", address:"adressOfTheCinema")
    cinema.save
    assert cinema.valid?
  end

  test 'should not save cinema without name' do
    cinema = Cinema.create(address:"adressOfTheCinema")
    cinema.save
    refute cinema.valid?
  end

  test 'should not save cinema without address' do
    cinema = Cinema.create(name:"cinemaName")
    cinema.save
    refute cinema.valid?
  end

  test 'should not save cinemas with the same name' do
    cinema = Cinema.create(name:"cinemaName", address:"adressOfTheCinema")
    cinema.save
    assert cinema.valid?

    cinema2 = Cinema.create(name:"cinemaName", address:"adressOfTheCinema")
    cinema2.save
    refute cinema2.valid?
  end


end
